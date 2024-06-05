import 'package:get/get.dart';

import '../controllers/do_routine_controller.dart';

class DoRoutineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoRoutineController>(
      () => DoRoutineController(),
    );
  }
}
