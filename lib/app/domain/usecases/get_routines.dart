import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:cron_client/app/domain/routine_list.dart';

class GetRoutines {
  final RoutineList routinelist;

  GetRoutines(this.routinelist);

  Future<List<RoutineEntity>> call() async {
    return await routinelist.getRoutines();
  }
}