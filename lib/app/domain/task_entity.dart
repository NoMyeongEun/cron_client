import 'package:hive/hive.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 0)
class TaskEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool isCompleted;

  TaskEntity(this.id, this.title, this.isCompleted);

  TaskEntity copyWith({String? id, String? title, bool? isCompleted}) {
    return TaskEntity(
      id ?? this.id,
      title ?? this.title,
      isCompleted ?? this.isCompleted,
    );
  }
}