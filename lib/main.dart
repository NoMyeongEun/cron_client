import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/domain/routine_list.dart';
import 'package:cron_client/app/domain/task_list.dart';
import 'package:cron_client/app/domain/usecases/get_routines.dart';
import 'package:cron_client/app/domain/usecases/save_routines.dart';
import 'package:cron_client/app/domain/usecases/get_tasks.dart';
import 'package:cron_client/app/domain/usecases/save_tasks.dart';
import 'package:cron_client/app/data/routine_data.dart';
import 'package:cron_client/app/data/routine_list_data.dart';
import 'package:cron_client/app/data/task_list_data.dart';
import 'package:cron_client/app/data/task_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());
  Hive.registerAdapter(RoutineEntityAdapter());
  Get.put(RoutineLocalDataSource());
  Get.put(TaskLocalDataSource());
  Get.put<RoutineList>(RoutineLIstImpl(Get.find()));
  Get.put<TaskList>(TaskLIstImpl(Get.find()));
  Get.put(GetTasks(Get.find()));
  Get.put(SaveTasks(Get.find()));
  Get.put(GetRoutines(Get.find()));
  Get.put(SaveRoutines(Get.find()));
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
