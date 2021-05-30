import 'package:appoint/src/connection/users.dart';

class UserController {
  User userLogged;
  bool logged = false;
  List<User> users = [];

  int findUser(String name, String email, String password){
    for(User i in users){
      print("/n*******USERS GUARDADOS*********" +i.name+i.email+i.password+i.id.toString());
    }
    if(users.isEmpty){
      return -1;
    }else {
      print("hay users busco: "+name.toString());
      int cont = 0;
      bool encontrado = false;
      for (User u in users) {
        if (name == u.name && email == u.email && password == u.password)
          encontrado = true;
        cont = u.id;
      }

      print(encontrado.toString()+cont.toString());
      if (encontrado)
        return cont;
      else
        return -1;
    }
  }

  User getUser(int index){
    return users.elementAt(index);
  }

  bool addUser(User user){
    if(findUser(user.name, user.email, user.password) == -1) {
      users.add(user);
      return true;
    }else {
      return false;
    }
  }

}