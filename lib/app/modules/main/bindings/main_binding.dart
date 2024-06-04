import 'package:get/get.dart';
import 'package:cron_client/app/domain/usecases/get_routines.dart';
import 'package:cron_client/app/domain/usecases/save_routines.dart';
import 'package:cron_client/app/modules/main/controllers/main_form_controller.dart';
import 'package:cron_client/app/modules/main/controllers/routine_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutineController>(
      () => RoutineController(Get.find<GetRoutines>(), Get.find<SaveRoutines>()),
    );
    Get.lazyPut<MainFormController>(
      () => MainFormController(),
    );
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
