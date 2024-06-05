import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/domain/usecases/get_tasks.dart';
import 'package:cron_client/app/domain/usecases/save_tasks.dart';

class TaskController extends GetxController {
  final GetTasks getTasks;
  final SaveTasks saveTasks;
  final textEditingController = TextEditingController();

  TaskController(this.getTasks, this.saveTasks);

  final tasks = <TaskEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final result = await getTasks();
    tasks.value = result;
    update();
  }

  void addRoutine(TaskEntity task) {
    tasks.add(task);
    saveTasks(tasks);
    textEditingController.clear();
    update();
  }

  void editTask(TaskEntity task) {
    final index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task;
    saveTasks(tasks);
    textEditingController.clear();
    update();
  }
}
