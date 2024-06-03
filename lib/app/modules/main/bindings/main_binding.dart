import 'package:get/get.dart';

import 'package:cron_client/app/modules/main/controllers/main_form_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainFormController>(
      () => MainFormController(),
    );
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
