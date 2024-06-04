import 'package:get/get.dart';

class MainController extends GetxController {

  int length = 1;
  var todos = <String>[].obs;

  // 아이템 추가 함수
  void addItem(String item) {
    todos.add(item);
  }

  // 아이템 제거 함수
  void removeItem(String item) {
    todos.remove(item);
  }
  
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
