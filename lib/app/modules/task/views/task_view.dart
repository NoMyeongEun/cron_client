import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cron_client/app/routes/app_pages.dart';
import '../controllers/task_controller.dart';
import '../controllers/manage_task_controller.dart';
import 'package:cron_client/app/modules/main/controllers/routine_controller.dart';
import 'package:cron_client/app/modules/task/controllers/runtask_controller.dart';
import 'package:cron_client/app/domain/usecases/get_tasks.dart';
import 'package:cron_client/app/domain/usecases/save_tasks.dart';
import 'package:cron_client/app/domain/usecases/get_routines.dart';
import 'package:cron_client/app/domain/usecases/save_routines.dart';
import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cron_client/app/modules/peoplestate_controller.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class TaskView extends GetView<ManageTaskController> {
  TaskView({Key? key}) : super(key: key);
  String input = "";
  String inputTitle = "";
  String inputIcon = "";
  var inputDuration = Duration(hours: 0, minutes: 1, seconds: 0).obs;
  Time _time = Time(hour: 0, minute: 1, second: 0);
  
  void onTimeChanged(Time t) {
    _time = t;
    inputDuration.value = Duration(hours: t.hour, minutes: t.minute, seconds: t.second);
  }
  final routine_id = Get.arguments;
  final controller = Get.put(ManageTaskController());
  final taskcontroller = Get.put(TaskController(Get.find<GetTasks>(), Get.find<SaveTasks>()));
  final routinecontroller = Get.put(RoutineController(Get.find<GetRoutines>(), Get.find<SaveRoutines>()));
  final runtaskcontroller = Get.put(RuntaskController());
  final peopleStatectroller = Get.put(PeopleStateController());

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 226, 163),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 131, 226, 163),
        title: const Text(""
        ),
        centerTitle: true,
      ),
     body: Column(
      children : [
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 10.0),
            child :
              Align(
                alignment: Alignment.center,
                child: 
                  SizedBox(
                        width: 500,
                        height: 100,
                        child:AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                '${routinecontroller.routines[routine_id].icon}\n${routinecontroller.routines[routine_id].title}',
                                textStyle: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            isRepeatingAnimation: false,
                            displayFullTextOnTap: true,
                            stopPauseOnTap: false,
                            totalRepeatCount : 1
                          ),
                      ),
                )
          ),
          
          Container(
                //color: Color.fromARGB(255, 255, 255, 255),
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
                                'Tasks',
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
                            child : 
                            Container(
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
                                                '새 태스크 추가하기',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                ),
                                              ),
                                          content: SizedBox(
                                            width : MediaQuery.of(context).size.width,
                                            child : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children : [
                                              Text(
                                                '태스크 이름',
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
                                                '태스크 아이콘',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                  ),
                                              ),
                                              DropdownButtonFormField<String?>(
                                                decoration: InputDecoration(
                                                  labelText: '태스크를 대표할 아이콘 🍀을 선택해주세요:)',
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
                                                '태스크 시작 시간',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'
                                                  ),
                                              ),
                                              SizedBox(
                                                child: showPicker(
                                                              isInlinePicker: true,
                                                              showSecondSelector: true,
                                                              context: context,
                                                              value: _time,
                                                              duskSpanInMinutes: 120, // optional
                                                              onChange: onTimeChanged,
                                                              //hideButtons : true,
                                                              showCancelButton : false,
                                                              iosStylePicker: true,
                                                              displayHeader : false,
                                                              is24HrFormat: true,
                                                              hourLabel : '시간',
                                                              minuteLabel : '분',
                                                              secondLabel: '초',
                                                              okText : '시간 설정 완료',
                                                              height: 180,
                                                              width: 575,
                                                              dialogInsetPadding : const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)
                                                          )
                                              ),
                                              SizedBox(height: 25),
                                            ]
                                          )
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
                                                routinecontroller.routines[routine_id].tasks.add(
                                                  TaskEntity(
                                                    routinecontroller.routines.length.toString(),//id
                                                    inputTitle.toString(),//title
                                                    false, 
                                                    inputIcon,
                                                    inputDuration.value
                                                  )
                                              );
                                              routinecontroller.editRoutine(routinecontroller.routines[routine_id]);
                                              Navigator.of(context).pop();	// input 입력 후 창 닫히도록
                                            },
                                            child: Text(
                                              "태스크 생성하기",
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
                                    );
                                  }, 
                                ),
                            )
                          )
                        ]
                      )
                    ), 
              ),
              SizedBox(
                height : 500,
                child: Obx(() {
                  return ListView.builder(
                    shrinkWrap:  true,
                    itemCount: routinecontroller.routines[routine_id].tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color : Color.fromARGB(0, 113, 103, 103),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        child: 
                          Container(
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
                                      routinecontroller.routines[routine_id].tasks[index].icon,
                                      style:TextStyle(
                                        fontSize: 35
                                      ),
                                    )
                                ),
                                title: Text(
                                  "${routinecontroller.routines[routine_id].tasks[index].title}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                subtitle: 
                                    Text(
                                      taskcontroller.formatDuration(routinecontroller.routines[routine_id].tasks[index].duration),
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 100, 100, 100),
                                        fontSize: 14,
                                        fontFamily: 'Noto Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                      );
                    },
                  );
                }),
              ),
          Container(
            width: 300,
            height: 52,
            margin: const EdgeInsets.only(
              top:  0,
              ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(237, 228, 243, 179), // 배경색 설정
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // 원하는 값으로 조절
                ),
              ),
              onPressed: () { Get.toNamed(Routes.DO_ROUTINE, arguments: routinecontroller.routines[routine_id]); },
              child: Container(
              alignment: Alignment.center,
              child: const Text(
                '태스크 시작하기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.40,
                ),
              ),
            ),
          ),
        ),
            ],
          ), 
    );
  }
}
