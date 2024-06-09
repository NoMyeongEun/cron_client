import 'package:get/get.dart';
import 'dart:async';
import 'package:cron_client/app/modules/notification/controllers/notification.dart';

class TaskTimer extends GetxController {
  var _counter = 0.obs;
  var nowTime = 0.obs;
  late Timer timer; 

  void resetCounter() {
    _counter.value = 0; // _counter 변수를 0으로 초기화
  }
 
  Future<void> toggleTimer(title_message, subtitle_message, targetNumber) async {
    resetCounter();
    await startTimer(title_message, subtitle_message, targetNumber);
  }
  
  Future<void> taskTimer(targetNumber) async {
    resetCounter();
    await startTaskTimer(targetNumber);
  }

  Future<void> startTimer(title_message, subtitle_message, targetNumber) async {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
        _counter++;
        if (_counter == targetNumber) {
          FlutterLocalNotification().showNotification(title_message, subtitle_message);
          timer.cancel();
        }
    }
    );
  }

  Future<void> stopTimer() async {
    try {timer.cancel(); }
    catch (e) {}
  }

  // 남은 시간 계산하는 Timer을 만들어서 -> 언제 cancel?
  Future<void> startTaskTimer(Duration duration) async {
    nowTime.value = duration.inSeconds;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (nowTime.value > 0) {
        nowTime.value--;
      } else {
        nowTime.value++;
      }
     }
    );
  }
  
  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}

