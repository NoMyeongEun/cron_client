import 'package:get/get.dart';
import 'package:cron_client/app/modules/peoplestate_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<PeopleStateController>(()=> PeopleStateController());
  }
}
