import 'task_entity.dart';

abstract class TaskList {
  Future<List<TaskEntity>> getTasks();
  Future<void> saveTasks(List<TaskEntity> tasks);
}