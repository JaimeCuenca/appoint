import 'package:appoint/src/connection/users.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  User loggedUser;

  HomeScreen(this.loggedUser, {Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class  _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    widget.loggedUser = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
        Text("Bienvenido ${widget.loggedUser.toString()}"),
      ),
    );
  }
}