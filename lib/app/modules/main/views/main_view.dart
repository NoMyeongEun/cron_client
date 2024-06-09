import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../controllers/routine_controller.dart';
import 'package:cron_client/app/routes/app_pages.dart';
import 'package:cron_client/app/domain/usecases/get_routines.dart';
import 'package:cron_client/app/domain/usecases/save_routines.dart';
import 'package:cron_client/app/modules/notification/controllers/notification.dart';
import 'package:cron_client/app/modules/peoplestate_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:cron_client/app/modules/main/controllers/swtich_controller.dart';
import 'package:intl/intl.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);
  String inputTitle = "";
  String inputIcon = "";
  List<bool> inputDay = [];
  List<DateTime> inputStarTime = [];
  bool inputIsAlarmOn = false;
  var newRoutinetime = "".obs;
  var routineHour = "".obs;
  var routineMiniute = "".obs;

  final controller = Get.put(MainController());
  final routinecontroller = Get.put(RoutineController(Get.find<GetRoutines>(), Get.find<SaveRoutines>()));
  final peopleStatectroller = Get.put(PeopleStateController());
  final switchcontroller = Get.put(SwtichController());
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 255, 232),
       automaticallyImplyLeading: false,
      ),
     body: Column(
      children : [
          Container (
            color : Color.fromARGB(255, 235, 255, 232),
            child : 
              Padding(
              padding: EdgeInsets.only(top: 70.0, left: 20.0, bottom: 20.0),
              child :
                SizedBox(
                      width: 500,
                      height: 100,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            '${peopleStatectroller.name.value}님,\n오늘도 활기찬 하루 시작해봐요!',
                            textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            '${peopleStatectroller.name.value}님,고민은 멈추고\n일단 시작해보는 게 어때요? ',
                            textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            '${peopleStatectroller.name.value}님,\n럭키비키한 하루 되세요! 🍀',
                            textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        pause : Duration(seconds: 5),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: false,
                        totalRepeatCount : 1
                      ),
                    ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child :
                  Padding(
                      padding: EdgeInsets.only(top: 20, left: 20.0, bottom: 5.0),
                      child : Row(
                        children : [
                          Align(
                            alignment: Alignment.centerLeft,
                            child : Container(
                              color: Color.fromARGB(0, 255, 68, 68),
                              child: Text(
                                '루틴',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            )
                          ),
                          SizedBox(width: 300),
                          Align(
                            alignment: Alignment.centerRight,
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
                                    Icons.add,
                                    color: Colors.black,
                                    size : 17
                                    ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                                '새 루틴 추가하기',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                ),
                                              ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children : [
                                              Text(
                                                '루틴 이름',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                ),
                                              ),
                                              TextField(
                                                onChanged: (String name) {
                                                  inputTitle = name;
                                                },
                                              ),
                                              SizedBox(height: 35),
                                              Text(
                                                '루틴 아이콘',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                  ),
                                              ),
                                              DropdownButtonFormField<String?>(
                                                decoration: InputDecoration(
                                                  labelText: '루틴을 대표할 아이콘 🍀을 선택해주세요:)',
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  labelStyle: TextStyle(fontSize: 15, color: Color.fromARGB(255, 113, 113, 113)),
                                                ),
                                                // underline: Container(height: 1.4, color: Color(0xffc0c0c0)),
                                                onChanged: (String? newValue) {
                                                  inputIcon = newValue.toString();
                                                },
                                                items:
                                                    [null, '☀️', '🛌'].map<DropdownMenuItem<String?>>((String? i) {
                                                  return DropdownMenuItem<String?>(
                                                    value: i,
                                                    child: Text(
                                                      {
                                                        '☀️': '☀️ 해',
                                                        '🛌': '🛌 침대'
                                                      }[i] ?? ' '
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                              SizedBox(height: 35),
                                              Text(
                                                '루틴 시작 시간',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                  ),
                                              ),
                                              Text(
                                                '현재 시간 : ${TimeOfDay.now().hour.toString().padLeft(2, '0')}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
                                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  final timeOfDay = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                                  if (timeOfDay != null) {
                                                    inputStarTime = [DateTime(0,0,0,timeOfDay.hour, timeOfDay.minute)];
                                                  }
                                                },
                                                child: Text(
                                                '시작 시간 바꾸기',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                  ),
                                              ),
                                                style : ElevatedButton.styleFrom(
                                                  fixedSize: Size(200,50),
                                                  shape : RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12)
                                                  )
                                                )
                                              ),
                                              SizedBox(height: 25),
                                              Text(
                                                '루틴 자동 시작(알림 설정)',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                  ),
                                              ),
                                              Obx(() => Text('현재 알람: ${(switchcontroller.on == true) ? "활성화" : "비활성화"}')),
                                              Obx(() => Switch(
                                                onChanged: (val) { 
                                                  switchcontroller.toggle();
                                                  inputIsAlarmOn = switchcontroller.on.value;
                                                }, 
                                                value: switchcontroller.on.value
                                                )
                                              )
                                            ]
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              style: ButtonStyle(
                                                minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 242, 223, 255)), // 배경색
                                                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 텍스트 색상
                                                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: const Color.fromARGB(255, 203, 203, 203), width: 0.6)), // 테두리 색상과 두께
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10), // 둥근 모서리 반경
                                                  ),
                                                )                    
                                              ),
                                              onPressed: (){
                                                routinecontroller.addRoutine(
                                                  RoutineEntity(
                                                    routinecontroller.routines.length.toString(),//id
                                                    inputTitle.toString(),//title
                                                    false, // iscompleted
                                                    [], // tasks
                                                    inputIcon, // icon
                                                    inputDay, // day
                                                    inputStarTime, // startTime
                                                    inputIsAlarmOn // isAlarmON
                                                  )
                                              );
                                              if (inputIsAlarmOn == true) {FlutterLocalNotification().showNotification2(inputStarTime[0].hour, inputStarTime[0].minute, 0,inputTitle.toString());}
                                              Navigator.of(context).pop();	// input 입력 후 창 닫히도록
                                            },
                                            child: Text(
                                              "루틴 생성하기",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Noto Sans'
                                              ),
                                              )
                                            )
                                          ]
                                        );
                                      }
                                    ); // 뒤로가기 버튼 클릭 시 이전 화면으로 이동
                                  }, 
                                ),
                            )
                          )
                        ]
                      )
                    ), 
              ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: routinecontroller.routines.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color : Color.fromARGB(0, 113, 103, 103),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        child: GetX<RoutineController>(
                          builder: (_) => Container(
                            height: 80,
                            child: Card(
                              elevation: 1,
                              margin: EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading : 
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child : 
                                      Text(
                                      "${routinecontroller.routines[index].icon}",
                                      style:TextStyle(
                                        fontSize: 35
                                      ),
                                    )
                                ),
                                title: Text(
                                  "${routinecontroller.routines[index].title}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                subtitle: 
                                  Row(
                                    children: [
                                        Text(
                                          "${DateFormat('HH: mm').format(routinecontroller.routines[index].startTime[0])}",
                                          style: TextStyle(
                                            color: const Color.fromARGB(255, 100, 100, 100),
                                            fontSize: 15,
                                            fontFamily: 'Noto Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          (routinecontroller.routines[index].isAlarmOn == true) ? Icons.alarm_on : Icons.alarm_off
                                        )
                                    ]
                                  ),
                                trailing: Container(
                                  width: 80.0, // Container의 너비
                                  height: 40.0, // Container의 높이
                                  decoration: BoxDecoration(
                                    //color:  Color.fromARGB(204, 255, 255, 255), // 배경 색상
                                    shape: BoxShape.rectangle, // 모양을 사각형으로 설정
                                    borderRadius: BorderRadius.circular(10.0),// 모양을 원으로 설정 (사각형으로 설정하려면 BoxShape.rectangle)
                                    border: Border.all(
                                      color: Color.fromARGB(255, 189, 189, 189), // 테두리 색상
                                      width: 1.0, // 테두리 두께
                                    ),
                                  ),
                                  child: IconButton(  
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color.fromARGB(255, 49, 107, 62),
                                        //size: 30,
                                      ),
                                      onPressed: () {
                                        Get.toNamed(Routes.TASK, arguments: index);
                                      },
                                    ),
                                )
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ), 
    );
  }
}