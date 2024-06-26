import 'package:get/get.dart';

import 'package:cron_client/app/domain/usecases/get_routines.dart';
import 'package:cron_client/app/domain/usecases/get_tasks.dart';
import 'package:cron_client/app/domain/usecases/save_routines.dart';
import 'package:cron_client/app/domain/usecases/save_tasks.dart';
import 'package:cron_client/app/modules/main/controllers/routine_controller.dart';
import 'package:cron_client/app/modules/task/controllers/manage_task_controller.dart';
import 'package:cron_client/app/modules/task/controllers/runtask_controller.dart';

import '../controllers/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RuntaskController>(
      () => RuntaskController(),
    );
    Get.lazyPut<ManageTaskController>(
      () => ManageTaskController(),
    );
    Get.lazyPut<TaskController>(
      () => TaskController(Get.find<GetTasks>(), Get.find<SaveTasks>()),
    );
    Get.lazyPut<RoutineController>(
      () =>
          RoutineController(Get.find<GetRoutines>(), Get.find<SaveRoutines>()),
    );
  }
}
