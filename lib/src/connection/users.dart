import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

part 'users.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  String password;

  @HiveField(2)
  String email;

  @HiveField(3)
  String photo;


  // Constructor
  User({@required this.name, this.password, this.email, this.photo});
}