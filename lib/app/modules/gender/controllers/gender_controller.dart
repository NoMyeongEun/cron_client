import 'package:cron_client/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:cron_client/app/modules/peoplestate_controller.dart';

class GenderController extends GetxController {
  final peopleStatectroller = Get.put(PeopleStateController());

  var name = ''.obs;
  var selectedCard = 2.obs;
  
  void nextPage() {
    var card = selectedCard.value;
    if ( card == 0) {
      peopleStatectroller.gender.value = "male";
    }
    if (card == 1) {
      peopleStatectroller.gender.value = "female";
    }
    peopleStatectroller.name.value = name.value;
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
