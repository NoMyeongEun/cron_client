import 'package:get/get.dart';

class TaskController extends GetxController {
  //TODO: Implement TaskController

  int length = 1;
  RxList<dynamic> todos = ["🛏️ 잠자리정리","💦 물 마시기", "💊 약/비타민 먹기","🛀 샤워하기", "🗓️ 오늘 일정 확인"].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
