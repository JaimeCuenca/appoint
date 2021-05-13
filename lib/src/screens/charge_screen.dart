import 'package:appoint/src/connection/users.dart';
import 'package:flutter/material.dart';

class ChargeScreen extends StatefulWidget {
  ChargeScreen(BuildContext context);

  _ChargeScreenState createState() => _ChargeScreenState();
}

class  _ChargeScreenState extends State<ChargeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:
        SizedBox(
          child:
            CircularProgressIndicator(strokeWidth: 60 , backgroundColor: Colors.deepPurple,),
        ),
      ),
    );
  }
}