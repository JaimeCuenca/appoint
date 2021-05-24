
import 'package:flutter/foundation.dart';
import 'users.dart';
import 'package:hive/hive.dart';

class UsersData extends ChangeNotifier {
  // Name our hive box for this data
  String _boxName = "usersBox";

  // Initialize our list of users
  List<User> _users = [];

  User _activeUsers;

 void getContacts() async {
    var box = await Hive.openBox<User>(_boxName);

   _users = box.values.toList();
    notifyListeners();
  }

  User getUser(index) {
    return _users[index];
  }

 int get userCount {
    return _users.length;
  }

  void addUser(User newUser) async {
    var box = await Hive.openBox<User>(_boxName);

    // Add a contact to our box
    await box.add(newUser);

    // Update our provider state data with a hive read, and refresh the ui
    _users = box.values.toList();
    notifyListeners();
  }


  /*void editUser({User user, int userKey}) async {
    var box = await Hive.openBox<User>(_boxName);

    // Add a contact to our box
    await box.put(userKey, user);

    // Update _contacts List with all box values
    _users = box.values.toList();

    // Update activeContact
    _activeUsers = box.get(userKey);

    print('New Name Of Contact: ' + user.name);

    // Update UI
    notifyListeners();
  }*/
}
