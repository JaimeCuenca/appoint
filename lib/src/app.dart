import 'package:appoint/src/screens/gallery_screen.dart';
import 'package:appoint/src/screens/home_screen.dart';
import 'package:appoint/src/screens/login_screen.dart';
import 'package:appoint/src/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'controller/user_controller.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  UserController userCont = new UserController();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Appoint',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.purple[300],
          accentColor: Colors.pink[200]
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(context, widget.userCont),
          '/register': (context) => RegisterScreen(context, widget.userCont),
          '/loggin': (context) => LoginScreen(context, widget.userCont),
          '/gallery': (context) => GalleryScreen(context)
        },
    );
  }
}
