import 'package:get/get.dart';
import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/modules/notification/timer.dart';
import 'dart:async';

class RuntaskController extends GetxController {
  TaskTimer tt = TaskTimer();

  void run(RoutineEntity routine, int task_id) async  { 
   String now_task = routine.tasks[task_id].title;
   String title_message = "${now_task} 시간이 끝났어요!";
   String subtitle_message = "";

   if ((routine.tasks.length - 1) == task_id) {
    subtitle_message = "루틴을 종료해 주세요!";
   }
   else {
    String next_task = routine.tasks[task_id + 1].title;
    subtitle_message = "${next_task} 시작해 주세요!";
   }
   tt.toggleTimer(title_message, subtitle_message, routine.tasks[task_id].duration.inSeconds);
  }
  
  String formatTime(int seconds, bool isTimeover) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    if (isTimeover == true) {
      return "+$minutes:$secondsStr";
    }
    else {
      return "$minutes:$secondsStr";
    }
    
  }
}
