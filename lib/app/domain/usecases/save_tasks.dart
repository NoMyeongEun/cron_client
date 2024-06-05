import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/domain/task_list.dart';

class SaveTasks {
  final TaskList tasklist;

  SaveTasks(this.tasklist);

  Future<void> call(List<TaskEntity> tasks) async {
    return await tasklist.saveTasks(tasks);
  }
}