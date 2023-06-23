import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'address_model.g.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  Address({
    required this.username,
    required this.address,
  });

  @HiveField(0)
  String username;
  @HiveField(1)
  String address;
}
