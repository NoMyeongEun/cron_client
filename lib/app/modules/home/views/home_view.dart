import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:cron_client/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children : [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child : Column(
              children: [
                SizedBox(height: 500),
                SizedBox(
                  width: 500,
                  child: Text(
                    '약간의 변화가\n만들어낼 큰 차이',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w700,
                      height: 1,
                      letterSpacing: -1,
                      ),
                    ),
                  ),
                SizedBox(height: 8),
                SizedBox(
                  width: 500,
                  child: Text(
                    'Change your life by slowly adding new healty habits and sticking to them.',
                    style: TextStyle(
                      color: Color(0xFFD7D9FF),
                      fontSize: 20,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w500,
                      height: 1,
                      ),
                    ),
                ),
                SizedBox(height: 70),
              ],
            )
          ),
          ElevatedButton(
            style : ElevatedButton.styleFrom(
              minimumSize: const Size(500,50)
              ),
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
                },
                child: const Text(
                  '시작하기',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w300,
                      ),
                  ),
                )
        ]
      )            
    );
  }
}
