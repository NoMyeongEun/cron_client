import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cron_client/app/routes/app_pages.dart';
import 'package:cron_client/app/modules/task/controllers/runtask_controller.dart';
import 'package:cron_client/app/domain/routine_entity.dart';

class DoRoutineController extends GetxController {
  Timer? timer;
  Timer? timer2;
  var isTimeover = false.obs;
  var isFirstClick = false.obs;
  var message = "시작하기".obs;
  var id = 0.obs;
  var nowTime = 0.obs;
  var taskTime = 0.obs;
  RoutineEntity routine = RoutineEntity('-1', "", false, [], "", [], [], false);
  
  final runtaskcontroller = Get.put(RuntaskController());

  void onPressed() {
      if (isFirstClick.value == false) {
        isFirstClick.value = true;
        message.value = "다음 태스크 시작하기";
      }
      else {
        id.value++;
      }
      timer?.cancel();
      timer2?.cancel();
      
      runtaskcontroller.tt.stopTimer();
      

      if (routine.tasks.length == id.value) {
          Get.toNamed(Routes.MAIN);//Routes.TASK, arguments: int.parse(routine.id)); // 원래 테스크 페이지로 돌아간다
          id.value = 0;
          return;
      }

      timer = Timer.periodic(const Duration(seconds: 1), (_) { 
        nowTime.value++; 
      });
      
      runtaskcontroller.run(routine,id.value);
      
      
      taskTime.value = routine.tasks[id.value].duration.inSeconds;
      isTimeover.value = false;

      // task 남은 시간 계산 용도 타이머
      timer2 = Timer.periodic(const Duration(seconds: 1), (_) { 
        if (taskTime.value.toInt() > 0 && isTimeover.value == false) {
          taskTime.value--;
        } 
        if (taskTime.value.toInt() == 0) {
          isTimeover.value = true;
        }
        if (isTimeover.value == true) {
          taskTime.value++;
        }
      }
     );
  }

  Text getMessage() {
    if (routine.tasks.length == (id.value + 1)) {message.value = "종료하기";}
    return Text(
            message.value,
            style: const TextStyle( 
                  //color: Color.fromARGB(0, 255, 0, 0),
                  fontSize: 30,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w800
            )
    );
  }

  String getRemainTime() {
    return runtaskcontroller.formatTime(taskTime.value.toInt(), isTimeover.value);
  }
  String doformatTime() {
    return runtaskcontroller.formatTime(nowTime.value.toInt(), false);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timer?.cancel();
    timer2?.cancel();
    super.onClose();
  }
}
