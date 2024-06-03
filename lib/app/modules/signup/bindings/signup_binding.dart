import 'package:get/get.dart';

import 'package:cron_client/app/modules/signup/controllers/register_form_controller.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterFormController>(
      () => RegisterFormController(),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
