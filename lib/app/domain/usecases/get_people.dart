import 'package:cron_client/app/domain/people_entity.dart';
import 'package:cron_client/app/data/people_data.dart';

class GetPeople{
  final People person;

  GetPeople(this.person);

  Future<PeopleEntity> call() async {
    return await person.getPeople();
  }
}