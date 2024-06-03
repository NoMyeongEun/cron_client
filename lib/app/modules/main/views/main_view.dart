import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import 'package:cron_client/app/routes/app_pages.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);
  String input = "";
  final controller = Get.put(MainController());

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
                  GetX<MainController>(
                    builder: (_) => Container (
                      height: 120,
                      child : Card(
                      elevation: 3,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(borderRadius:
                      BorderRadius.circular(8)
                      ),
                      child : ListTile(
                        title: Text(
                          "${controller.todos()[index]}",
                          style:  TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Noto Sans',fontWeight: FontWeight.w500),
                          ),
                        trailing: IconButton(icon: Icon(
                          Icons.arrow_right_sharp,
                          color: Colors.black
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.TASK);
                       }),
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
