import 'dart:io';

import 'package:appoint/src/connection/database.dart';
import 'package:appoint/src/connection/users.dart';

class UserController {
  User userLogged;
  bool logged = false;
  List<User> users = [];

  int findUser(String name){
    downloadUsers();
    if(users == null){
      return -1;
    }else {
      int cont = 0;
      bool encontrado = false;
      for (User u in users) {
        if (name == u.name)
          encontrado = true;
        cont = u.id;
      }

      if (encontrado)
        return cont;
      else
        return -1;
    }
  }

  User getUser(int index){
    downloadUsers();
    return users.elementAt(index);
  }

  bool addUser(User user){
    downloadUsers();
    if(findUser(user.name) == -1) {
      database().users.add(user);
      return true;
    }else {
      return false;
    }
  }

  void downloadUsers(){
    this.users = database().users;
  }

}