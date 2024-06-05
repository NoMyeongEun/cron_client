import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:cron_client/app/modules/notification/controllers/notification.dart';
import "dart:io";

class TaskTimer {
  var _counter = 0.obs;
  late Timer timer; 

  void resetCounter() {
    _counter.value = 0; // _counter 변수를 0으로 초기화
  }
 
  Future<void> toggleTimer(targetNumber) async {
    resetCounter();
    await startTimer(targetNumber);
    return ;
  }
 
  Future<void> startTimer(targetNumber) async {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
        print(_counter);
        _counter++;
        if (_counter == targetNumber) {
          FlutterLocalNotification().showNotification();
          timer.cancel();
        }
    }
    );
  }
}
