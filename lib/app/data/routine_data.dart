import 'package:hive/hive.dart';
import '../domain/routine_entity.dart';

class RoutineLocalDataSource {
  final String _boxName = 'routines';
  Future<Box<RoutineEntity>> get _routinesBox async => await Hive.openBox(_boxName);

  Future<List<RoutineEntity>> getRoutines() async {
    final box = await _routinesBox;
    return box.values.toList();
  }

  Future<void> saveRoutines(List<RoutineEntity> routines) async {
    final box = await _routinesBox;
    for (final routine in routines) {
      await box.put(routine.id, routine);
    }
  }
}