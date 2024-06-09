import 'package:cron_client/app/domain/people_entity.dart';
import 'package:cron_client/app/data/people_data.dart';

class SavePeople {
  final People person;

  SavePeople(this.person);

  Future<void> call(PeopleEntity p) async {
    return await person.savePeople(p);
  }
}