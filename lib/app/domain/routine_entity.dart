import 'package:cron_client/app/domain/task_entity.dart';
import 'package:hive/hive.dart';
part 'routine_entity.g.dart';

@HiveType(typeId: 1)
class RoutineEntity {
  @HiveField(0)
  final String id; // id
  @HiveField(1)
  final String title; // 이름
  @HiveField(2)
  final bool isCompleted; // 완료 여부 : 매일 초기화
  @HiveField(3)
  final List<TaskEntity> tasks; // 태스크 목록
  @HiveField(4)
  final String icon; // 루틴 대표 아이콘
  @HiveField(5)
  final List<bool> day; // 루틴 활성화 요일(월~일)
  @HiveField(6)
  final List<DateTime> startTime; // 요일별 루틴 시작 시간
  @HiveField(7)
  final bool isAlarmOn; // 알람 설정이 켜져있는지

  RoutineEntity(
    this.id,
    this.title,
    this.isCompleted,
    this.tasks,
    this.icon,
    this.day,
    this.startTime,
    this.isAlarmOn
  );
}