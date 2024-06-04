import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cron_client/app/domain/routine_entity.dart';
import 'package:cron_client/app/domain/usecases/get_routines.dart';
import 'package:cron_client/app/domain/usecases/save_routines.dart';

class RoutineController extends GetxController {
  final GetRoutines getRoutines;
  final SaveRoutines saveRoutines;
  final textEditingController = TextEditingController();

  RoutineController(this.getRoutines, this.saveRoutines);

  final routines = <RoutineEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRoutines();
  }

  Future<void> loadRoutines() async {
    final result = await getRoutines();
    routines.value = result;
    update();
  }

  void addRoutine(RoutineEntity routine) {
    routines.add(routine);
    saveRoutines(routines);
    textEditingController.clear();
    update();
  }

  void editRoutine(RoutineEntity routine) {
    final index = routines.indexWhere((element) => element.id == routine.id);
    routines[index] = routine;
    saveRoutines(routines);
    textEditingController.clear();
    update();
  }

}
