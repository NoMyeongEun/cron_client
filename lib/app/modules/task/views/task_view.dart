import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cron_client/app/routes/app_pages.dart';
import '../controllers/task_controller.dart';
import '../controllers/manage_task_controller.dart';
import 'package:cron_client/app/modules/main/controllers/routine_controller.dart';
import 'package:cron_client/app/domain/usecases/get_tasks.dart';
import 'package:cron_client/app/domain/usecases/save_tasks.dart';
import 'package:cron_client/app/domain/usecases/get_routines.dart';
import 'package:cron_client/app/domain/usecases/save_routines.dart';
import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TaskView extends GetView<ManageTaskController> {
  TaskView({Key? key}) : super(key: key);
  String input = "";
  final routine_id = Get.arguments;
  final controller = Get.put(ManageTaskController());
  final taskcontroller = Get.put(TaskController(Get.find<GetTasks>(), Get.find<SaveTasks>()));
  final routinecontroller = Get.put(RoutineController(Get.find<GetRoutines>(), Get.find<SaveRoutines>()));
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Cron',
          style : TextStyle(color: Colors.white) 
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton( // 오른쪽 아래 floating 버튼
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Add Todolist"),
                content: TextField(
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(onPressed: (){
                    controller.addItem(input);
                    routinecontroller.routines[routine_id].tasks.add(TaskEntity(routinecontroller.routines[routine_id].tasks.length.toString(), input.toString(), false));
                    routinecontroller.editRoutine(routinecontroller.routines[routine_id]);
                    /*
                    taskcontroller.addRoutine(
                      TaskEntity(taskcontroller.tasks.length.toString(), input.toString(), false)
                    );
                    */
                    Navigator.of(context).pop();	// input 입력 후 창 닫히도록
                  },
                  child: Text("Add"))
                ]
              );
            });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
     body: Column(
      children : [
          Padding(
            padding: EdgeInsets.only(top: 70.0, left: 20.0, bottom: 10.0),
            child :
              SizedBox(
                    width: 500,
                    height: 100,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          '명은님,\n오늘도 활기찬 하루 시작해봐요!',
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
                    ),
                  ),
            ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: routinecontroller.routines[routine_id].tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        child: GetX<TaskController>(
                          builder: (_) => Container(
                            height: 120,
                            child: Card(
                              elevation: 1,
                              margin: EdgeInsets.all(1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading : Text(
                                  "☀️",
                                  style:TextStyle(
                                    fontSize: 30
                                  ),
                                ),
                                title: Text(
                                  "${routinecontroller.routines[routine_id].tasks[index].title}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  "${routinecontroller.routines[routine_id].tasks[index].id}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.arrow_right_sharp,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.TASK);
                                  },
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
            ],
          ), 
    );
  }
}
