import 'package:appoint/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name){
            case "/":
              return LoginScreen();
          }
        });
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan[300]
      ),
    );
  }
}