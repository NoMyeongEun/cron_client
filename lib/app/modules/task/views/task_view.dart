import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  TaskView({Key? key}) : super(key: key);
  String input = "";
  
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
      floatingActionButton: FloatingActionButton(
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
      body: ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (BuildContext con, int index) {
            return Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  GetX<TaskController>(
                    builder: (_) => Container (
                      height: 60,
                      child : Card(
                      elevation: 3,
                      margin: EdgeInsets.only(left:4, right : 4, top: 2, bottom:2),
                      shape: RoundedRectangleBorder(borderRadius:
                      BorderRadius.circular(4)
                      ),
                      child : ListTile(
                        title: Text(
                          "${controller.todos()[index]}",
                          style:  TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Noto Sans',fontWeight: FontWeight.w500),
                          ),
                        
                      ))
                    )
                  ),
                ],
              ),
            );
          },
        ),
    );
  }
}
