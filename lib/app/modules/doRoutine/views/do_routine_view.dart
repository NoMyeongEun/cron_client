import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/do_routine_controller.dart';
import 'package:cron_client/app/domain/routine_entity.dart';

class DoRoutineView extends GetView<DoRoutineController> {
  DoRoutineView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    RoutineEntity routine = Get.arguments;
    Get.delete<DoRoutineController>();
    final doroutinecontroller = Get.put(DoRoutineController());
    doroutinecontroller.routine = routine;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 226, 163),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 131, 226, 163),        
      ),
      body: Center (
        child : Column (
            children : [
              SizedBox(height: 30),
              Text(
                "${routine.title}",
                style : TextStyle(
                  fontSize: 22,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w800
                )
              ),
              SizedBox(height: 20),
              Container(
                height: 300,
                width:  400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                alignment: Alignment.center,
                child : Center(
                    child: Column(
                      children : [
                        SizedBox(height: 5),
                        Obx(() => Text(
                          "${routine.tasks[doroutinecontroller.id.value].icon}",
                          style : TextStyle(
                            fontSize: 50,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w800
                          )
                          ),
                        ),
                        Obx(() => Text(
                          "${routine.tasks[doroutinecontroller.id.value].title}",
                          style : TextStyle(
                            fontSize: 40,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w800
                          )
                          )
                        ),
                        Obx(() => Text(
                          doroutinecontroller.getRemainTime(),
                          style : TextStyle(
                            fontSize: 80,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w800,
                            color: (doroutinecontroller.isTimeover.value == true) ? Color.fromARGB(255, 255, 120, 120) : Color.fromARGB(255, 56, 56, 56)
                          )
                          )
                        )
                      ]
                    )
                  ),
              ),
              SizedBox(height: 40),
              Container(
                width: 170,
                height: 60,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                  )
                ),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children : [
                    Icon(
                          Icons.alarm_on,
                          color: Colors.black,
                          size : 30
                    ),
                    SizedBox(width: 10),
                    Obx(() => Text(
                          doroutinecontroller.doformatTime(),
                          style : TextStyle(
                            fontSize: 30,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w800
                          )
                          )
                        ),
                    ]
                )
              ),
              SizedBox(height: 50),
              RawMaterialButton(
                onPressed: () {
                  doroutinecontroller.onPressed();

                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.arrow_circle_right_rounded,
                  size: 80.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
               ),
               SizedBox(height: 10),
                Obx( () => doroutinecontroller.getMessage()
              ),
            ]
        )
      )
    );
  }
}
