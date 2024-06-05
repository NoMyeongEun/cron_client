import 'package:hive/hive.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 0)
class TaskEntity {
  @HiveField(0)
  final String id; // id
  @HiveField(1)
  final String title; // 태스크 이름
  @HiveField(2)
  final bool isCompleted; // 태스크 완료 여부
  @HiveField(3)
  final String icon; // 태스크 대표 아이콘
  @HiveField(4)
  final Duration duration; // 기간

  TaskEntity(
    this.id,
    this.title,
    this.isCompleted,
    this.icon,
    this.duration
  );

}