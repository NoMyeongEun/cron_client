import 'package:cron_client/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class GenderController extends GetxController {
  var name = ''.obs;
  var selectedCard = 2.obs;
  
  void nextPage() {
    Get.toNamed(Routes.GOAL);
  }
  
  String getCardText(int index) {
    switch (index) {
      case 0:
        return '🙋🏻‍♂️\n남자';
      case 1:
        return '🙋🏻‍♀️\n여자';
      default:
        return '$index';
    }
  }

}
