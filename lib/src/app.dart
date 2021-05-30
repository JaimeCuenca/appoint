import 'package:appoint/src/screens/edit_screen.dart';
import 'package:appoint/src/screens/form_desc.dart';
import 'package:appoint/src/screens/form_result.dart';
import 'package:appoint/src/screens/form_style.dart';
import 'package:appoint/src/screens/form_tam_color.dart';
import 'package:appoint/src/screens/form_zone.dart';
import 'package:appoint/src/screens/gallery_screen.dart';
import 'package:appoint/src/screens/home_screen.dart';
import 'package:appoint/src/screens/login_screen.dart';
import 'package:appoint/src/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'controller/user_controller.dart';
import 'dart:async';

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
          primaryColor: Colors.red[700],
          accentColor: Colors.redAccent
        ),
        home: SplashScreen(context, widget.userCont),
        routes: {
          '/home': (context) => HomeScreen(context, widget.userCont),
          '/register': (context) => RegisterScreen(context, widget.userCont),
          '/loggin': (context) => LoginScreen(context, widget.userCont),
          '/gallery': (context) => GalleryScreen(context, widget.userCont),
          '/edit': (context) => EditScreen(context, widget.userCont),
          '/form_style': (context) => FormStyleScreen(context, widget.userCont),
          '/form_zone': (context) => FormZoneScreen(context, widget.userCont),
          '/form_tam_color': (context) => FormTamColorScreen(context, widget.userCont),
          '/form_desc': (context) => FormDescScreen(context, widget.userCont),
          '/form_result': (context) => FormResultScreen(context, widget.userCont),
        },
    );
  }

  @override
  void dispose() {
    widget.userCont.logged=false;
  }
}

class SplashScreen extends StatefulWidget{
  BuildContext context;
  UserController userCont;

  SplashScreen(this.context, this.userCont, {Key key}) : super(key: key);
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
        (){
          Navigator.of(context).pushNamed('/home', arguments: widget.userCont);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/logo.png"), fit: BoxFit.contain),
                gradient: LinearGradient(
                    colors: [Colors.red[100], Colors.red[200]]
                )
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 170,),
                Image.network('https://freight.cargo.site/t/original/i/c6e39e55a180294bd6de29ad98d97706b4ed7b102ae35caab3bea66cc21571d6/tatmachine1.gif', height: 200,),
              ],
            ),
          ),
        ]
      ),
    );
  }
}