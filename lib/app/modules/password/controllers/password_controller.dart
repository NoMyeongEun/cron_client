import 'package:cron_client/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:cron_client/app/modules/peoplestate_controller.dart';

class PasswordController extends GetxController {
  final peopleStatectroller = Get.put(PeopleStateController());

  var password = ''.obs;
  var confirmPassword = ''.obs;
  var errorMessage = ''.obs;

  void checkPassword() {
    if (password.value != confirmPassword.value) {
      errorMessage.value = '비밀번호가 일치하지 않습니다';
      Get.snackbar('오류', '비밀번호가 일치하지 않습니다',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      errorMessage.value = '';
      peopleStatectroller.password.value = password.value;
      Get.toNamed(Routes.GENDER);
    }
  }

}
