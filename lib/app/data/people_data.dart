import 'package:hive/hive.dart';
import 'package:cron_client/app/domain/people_entity.dart';

class PeopleLocalDataSource {
  final String _boxName = 'people';
  Future<Box<PeopleEntity>> get _peopleBox async => await Hive.openBox(_boxName);

  Future<PeopleEntity> getPeople() async {
    final box = await _peopleBox;
    PeopleEntity result = PeopleEntity("email", "password", "name", "gender", []);
    PeopleEntity? person = box.get(0);
    if (person != null) {
         PeopleEntity result = person;
    } 
    return result;
  }

  Future<void> savePeople(PeopleEntity people) async {
    final box = await _peopleBox;
    await box.put(people.email, people);
  }
}

abstract class People {
  Future<PeopleEntity> getPeople();
  Future<void> savePeople(PeopleEntity person);
}

class PeopleImpl implements People{
  final PeopleLocalDataSource localDataSource;

  PeopleImpl(this.localDataSource);

  @override
  Future<PeopleEntity> getPeople() {
    return localDataSource.getPeople();
  }

  @override
  Future<void> savePeople(PeopleEntity person) {
    return localDataSource.savePeople(person);
  }
}