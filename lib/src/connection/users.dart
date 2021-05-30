import 'package:appoint/src/connection/tattoo.dart';

class User {
  int id;
  String name;
  String password;
  String email;
  Tattoo tattooOnCreated = new Tattoo("TRADICIONAL", "MANO", "<5", true, "");


  // Constructor
  User(this.name, this.password, this.email, this.id);
}