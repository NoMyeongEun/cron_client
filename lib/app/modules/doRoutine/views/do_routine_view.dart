import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../controllers/do_routine_controller.dart';
import 'package:cron_client/app/modules/task/controllers/runtask_controller.dart';
import 'package:cron_client/app/modules/main/controllers/routine_controller.dart';

class DoRoutineView extends GetView<DoRoutineController> {
  DoRoutineView({Key? key}) : super(key: key);
  final runtaskcontroller = Get.put(RuntaskController());
  var id = 0.obs;
  var nowTime = 0.obs;
  late Timer timer;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(223, 255, 255, 255),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top : 5.0, bottom : 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
              child : Container(
              width: 40.0, // Container의 너비
              height: 40.0, // Container의 높이
              decoration: BoxDecoration(
                color:  Color.fromARGB(204, 255, 255, 255), // 배경 색상
                shape: BoxShape.rectangle, // 모양을 사각형으로 설정
                borderRadius: BorderRadius.circular(15.0),// 모양을 원으로 설정 (사각형으로 설정하려면 BoxShape.rectangle)
                border: Border.all(
                  color: Color.fromARGB(255, 189, 189, 189), // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size : 17
                    ),
                  onPressed: () {
                    Navigator.pop(context); // 뒤로가기 버튼 클릭 시 이전 화면으로 이동
                  }, 
                ),
            )
          )
        ),
        title: Container(
          margin: const EdgeInsets.only(
            right: 130,
          ),
          child: const Text(
            "당신에 대해 알려주세요!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Noto Sans',
              fontWeight: FontWeight.w800,
              height: 0,
              letterSpacing: -0.40,
            ),
          ),
        ),
      ),
      body: Column (
        children : [
          TextButton(
              onPressed: () {                 
                timer = Timer.periodic(const Duration(seconds: 1), (_) { 
                  nowTime.value++; 
                  if (nowTime.value == Get.arguments.tasks[id.value].duration.inSeconds) {
                    timer.cancel();
                  } 
                });
                runtaskcontroller.run(Get.arguments,id.value);
                id.value++;
              },
              child : Text("테스트 시작하기")
          ),
          Text("${Get.arguments.title}"),
          Obx(() => Text(nowTime.value.toString())),
          Obx(() => Text("${Get.arguments.tasks[id.value].title}"))
        ]
      )
    );
  }
}
