import 'package:get/get.dart';
import 'package:cron_client/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cron_client/app/modules/peoplestate_controller.dart';
import 'package:cron_client/app/modules/notification/controllers/notification.dart';

class LoginController extends GetxController {
  TextEditingController pwd_controller = TextEditingController();
  final peopleStatectroller = Get.put(PeopleStateController());
  var password = ''.obs;
  var errorMessage = ''.obs;

  Future<void> login(String email) async {
    String response = await getPassword(email, pwd_controller.text);
    if (response == "fail" ) {
      errorMessage.value = '비밀번호가 일치하지 않습니다';
      Get.snackbar('오류', '비밀번호가 일치하지 않습니다',
          snackPosition: SnackPosition.TOP);
      pwd_controller.clear();
    } else {
      errorMessage.value = '';
      final notification = FlutterLocalNotification();
       notification.init();
       Future.delayed(const Duration(seconds: 3),
        notification.requestNotificationPermission());
      Get.toNamed(Routes.MAIN);
    }
  }

  Future<String> getPassword(String email, String pwd) async {
    const APP_REDIRECT_URI = "com.myeongeun.cron";
    final register = await http.post(Uri.parse("http://13.124.38.51:80/auth/verify"), 
      headers: {
          'Content-Type' : 'application/json' 
      },
      body : json.encode({
        "email": email,
        "pwd" : pwd
      })
    );
    if (json.decode(register.body)["result"] != "fail") {
        peopleStatectroller.name.value =  jsonDecode(utf8.decode(register.bodyBytes))["username"];
        peopleStatectroller.gender.value = json.decode(register.body)["gender"];
        //peopleStatectroller.goal.value = json.decode(register.body)["goal"];
    }
    return json.decode(register.body)["result"];
  }
}