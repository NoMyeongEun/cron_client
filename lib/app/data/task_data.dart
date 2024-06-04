import 'package:hive/hive.dart';
import '../domain/task_entity.dart';

class TaskLocalDataSource {
  final String _boxName = 'tasks';
  Future<Box<TaskEntity>> get _tasksBox async => await Hive.openBox(_boxName);

  Future<List<TaskEntity>> getTasks() async {
    final box = await _tasksBox;
    return box.values.toList();
  }

  Future<void> saveTodos(List<TaskEntity> tasks) async {
    final box = await _tasksBox;
    for (final task in tasks) {
      await box.put(task.id, task);
    }
  }
}