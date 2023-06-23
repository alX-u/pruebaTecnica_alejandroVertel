import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class Users extends HiveObject {
  Users({
    required this.username,
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.address,
    required this.password,
  });

  @HiveField(0)
  String username;
  @HiveField(1)
  String name;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String birthDate;
  @HiveField(4)
  String address;
  @HiveField(5)
  String password;
}
