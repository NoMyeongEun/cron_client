import 'package:get/get.dart';
import 'package:cron_client/app/routes/app_pages.dart';

class GoalController extends GetxController {
  var name = ''.obs;
  var selectedCards = <int>{}.obs;
  
  void nextPage() {
    Get.toNamed(Routes.MAIN);
  }
  
  void toggleSelection(int index) {
    if (selectedCards.contains(index)) {
      selectedCards.remove(index);
    } else {
      selectedCards.add(index);
    }
  }

  String getCardText(int index) {
    switch (index) {
      case 0:
        return '☀️\n기상';
      case 1:
        return '😴\n취침';
      case 2:
        return '🏃🏻‍♀️\n운동';
      case 3:
        return '📖\n독서';
      case 4:
        return '🧑🏻‍💻\n공부';
      case 5:
        return '🍀\n휴식';
      default:
        return '$index';
    }
  }
}
