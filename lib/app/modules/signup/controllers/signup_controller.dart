import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cron_client/app/routes/app_pages.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

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

  Future<void> checkIfRegistered(String email) async {
    // 서버에 연결해서 해당 이메일이 등록되어있는지 확인하는 로직
    // 만약 등록되어있다면 비밀번호 입력하는 페이지로 이동
    Get.toNamed(Routes.LOGIN);
    // 만약 등록되어이있지 않다면 새로 가입하는 페이지로 이동
  }


  Future<void> signIn(String email) async {
    // 고유한 redirect uri
    const APP_REDIRECT_URI = "com.myeongeun.cron";

    // 백엔드가 제공한 로그인 페이지에서 로그인 후 callback 데이터 반환
    final register = await http.post(Uri.parse("http://localhost:8000/auth/register"), 
      headers: {
          'Content-Type' : 'application/json' 
      },
      body : json.encode({
        "username": "dding",
        "email": email,
        "first_name": " ",
        "last_name": " ",
        "password": "pwd",
        'redirect_uri': '$APP_REDIRECT_URI:/'
      })
      ).toString();
  }
}

    /*
    final login = await http.post(Uri.parse("http://localhost:8000/auth/token"), 
      headers: {
          'Content-Type' : 'application/json' 
      },
      body : json.encode({
        "grant_type" : '',
        "username": "dding",
        "password": "0787",
        "scope" : '',
        "client_id" : '',
        "client_secret" : '',
        'redirect_uri': '$APP_REDIRECT_URI:/'
      })
      );
    print(login.body);
    */