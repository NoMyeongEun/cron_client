import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cron_client/app/domain/people_entity.dart';
import 'package:cron_client/app/domain/usecases/get_people.dart';
import 'package:cron_client/app/domain/usecases/save_people.dart';

class PeopleController extends GetxController {
  final GetPeople getPeople;
  final SavePeople savePeople;
  final textEditingController = TextEditingController();

  PeopleController(this.getPeople, this.savePeople);

  final people = <PeopleEntity>[].obs;
  final email = "".obs;
  final password = "".obs;
  final name = "".obs;
  final gender = "".obs;
  final goal = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadPeople();
  }

  Future<void> loadPeople() async {
    final result = await getPeople();
    people.value = [result];
    update();
  }

  void addPeople(PeopleEntity person) {
    people.add(person);
    savePeople(person);
    textEditingController.clear();
    update();
  }

  void editPeople(PeopleEntity person) {
    savePeople(person);
    textEditingController.clear();
    update();
  }

}