import 'package:cron_client/app/domain/task_entity.dart';
import 'package:cron_client/app/domain/task_list.dart';

class GetTasks {
  final TaskList tasklist;

  GetTasks(this.tasklist);

  Future<List<TaskEntity>> call() async {
    return await tasklist.getTasks();
  }
}