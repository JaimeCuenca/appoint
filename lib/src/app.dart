import 'package:appoint/src/screens/charge_screen.dart';
import 'package:appoint/src/screens/home_screen.dart';
import 'package:appoint/src/screens/login_screen.dart';
import 'package:appoint/src/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'connection/users.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FutureBuilder(
        future: Hive.openBox('users'),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return LoginScreen(context);
          }else{
            return ChargeScreen(context);
          }
        }
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name){
            case "/":
              return LoginScreen(context);
            case "/home":
              User userLogged = settings.arguments;
              return HomeScreen(userLogged);
            case "/register":
              return RegisterScreen(context);
          }
        });
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple[300],
        accentColor: Colors.pink[200]
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('users').close();
    super.dispose();
  }
}