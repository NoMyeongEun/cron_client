import 'routine_entity.dart';

abstract class RoutineList {
  Future<List<RoutineEntity>> getRoutines();
  Future<void> saveRoutines(List<RoutineEntity> routines);
}