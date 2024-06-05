import 'package:get/get.dart';
import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/modules/notification/timer.dart';

class RuntaskController extends GetxController {
  void run(RoutineEntity routine, int task_id) async  { 
   TaskTimer().toggleTimer(routine.tasks[task_id].duration.inSeconds);
  }
}
