import 'routine_data.dart';
import '../domain/routine_entity.dart';
import '../domain/routine_list.dart';

class RoutineLIstImpl implements RoutineList{
  final RoutineLocalDataSource localDataSource;

  RoutineLIstImpl(this.localDataSource);

  @override
  Future<List<RoutineEntity>> getRoutines() {
    return localDataSource.getRoutines();
  }

  @override
  Future<void> saveRoutines(List<RoutineEntity> todos) {
    return localDataSource.saveRoutines(todos);
  }
}