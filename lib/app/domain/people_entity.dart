import 'package:hive/hive.dart';

part 'people_entity.g.dart';

@HiveType(typeId: 2)
class PeopleEntity {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final List<String> goal; 

  PeopleEntity(
    this.email,
    this.password,
    this.name,
    this.gender,
    this.goal
  );
}