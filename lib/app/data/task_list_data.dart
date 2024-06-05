import 'task_data.dart';
import '../domain/task_entity.dart';
import '../domain/task_list.dart';

class TaskLIstImpl implements TaskList{
  final TaskLocalDataSource localDataSource;

  TaskLIstImpl(this.localDataSource);

  @override
  Future<List<TaskEntity>> getTasks() {
    return localDataSource.getTasks();
  }

  @override
  Future<void> saveTasks(List<TaskEntity> tasks) {
    return localDataSource.saveTasks(tasks);
  }
}