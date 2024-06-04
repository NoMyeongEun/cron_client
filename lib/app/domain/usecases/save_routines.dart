import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:cron_client/app/domain/routine_list.dart';

class SaveRoutines {
  final RoutineList routinelist;

  SaveRoutines(this.routinelist);

  Future<void> call(List<RoutineEntity> routines) async {
    return await routinelist.saveRoutines(routines);
  }
}