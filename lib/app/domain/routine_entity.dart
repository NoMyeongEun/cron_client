import 'package:cron_client/app/domain/task_entity.dart';
import 'package:hive/hive.dart';
import 'package:cron_client/app/domain/task_list.dart';
part 'routine_entity.g.dart';

@HiveType(typeId: 1)
class RoutineEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool isCompleted;
  @HiveField(3)
  final List<TaskEntity> tasks;

  RoutineEntity(this.id, this.title, this.isCompleted, this.tasks);
}