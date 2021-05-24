import 'package:appoint/src/screens/home_screen.dart';
import 'package:appoint/src/screens/login_screen.dart';
import 'package:appoint/src/screens/register_screen.dart';
import 'package:appoint/src/connection/user_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersData(),
      child: MaterialApp(
        title: 'Appoint',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.purple[300],
          accentColor: Colors.pink[200]
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder(
            future: _initHive(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.error != null) {
                  print(snapshot.error);
                  return Scaffold(
                    body: Center(
                      child: Text('Error initializing hive data store.'),
                    ),
                  );
                } else {
                  return HomeScreen(context);
                }
              } else {
                return Scaffold(
                  body: Center(
                    child:
                    SizedBox(
                      child:
                      Text('Hola'),
                    ),
                  ),
                );;
              }
            },
          ),
          '/register': (context) => RegisterScreen(context),
          '/loggin': (context) => LoginScreen(context)
        },
      )
    );
  }

  Future _initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
}
