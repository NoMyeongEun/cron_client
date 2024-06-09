import 'package:cron_client/app/domain/people_entity.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cron_client/app/routes/app_pages.dart';
import 'package:cron_client/app/modules/peoplestate_controller.dart';

class SignupController extends GetxController {
  final peopleStatectroller = Get.put(PeopleStateController());

  Future<void> login(String email) async {
    peopleStatectroller.email.value = email;
    String response = await checkIfRegistered(email);
    // 서버에 연결해서 해당 이메일이 등록되어있는지 확인하는 로직
    if ( response == "true") {
      // 만약 등록되어있다면 비밀번호 입력하는 페이지로 이동
      Get.toNamed(Routes.LOGIN, arguments: email);
    }
    else {
      // 만약 등록되어이있지 않다면 새로 가입하는 페이지로 이동
      Get.toNamed(Routes.PASSWORD);
    }
    
  }

  Future<String> checkIfRegistered(String email) async {
    const APP_REDIRECT_URI = "com.myeongeun.cron";
    final register = await http.post(Uri.parse("http://13.124.38.51:80/auth/check"), 
      headers: {
          'Content-Type' : 'application/json' 
      },
      body : json.encode({
        "email": email,
      })
    );
    return json.decode(register.body)["registered"];
  }

  Future<void> signIn() async {
    const APP_REDIRECT_URI = "com.myeongeun.cron";

    final register = await http.post(Uri.parse("http://13.124.38.51:80/auth/register"), 
      headers: {
          'Content-Type' : 'application/json' 
      },
      body : json.encode(
        {
          "email": peopleStatectroller.email.value,
          "password": peopleStatectroller.password.value,
          "username": peopleStatectroller.name.value,
          "gender": peopleStatectroller.gender.value,
          "goal": peopleStatectroller.goal.value
        }
      )
      ).toString();
    }
}