import 'package:appoint/src/connection/users.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  BuildContext context;

  HomeScreen(this.context, {Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class  _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("HOME"),
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Usuario"),
          ),
          body: Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.person_pin),
                  iconSize: 200,
                  onPressed: () {_showLoggin(context);},)
          ),
        ),
       ),
      body:Stack(
          children:
          [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple[300], Colors.pink[200]]
                )
            ),
          ),
          Transform.translate(
            offset: Offset(0, -15),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          margin: const EdgeInsets.only(left: 20, right: 20, top: 200, bottom: 20),
                          child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Galeria stock", style: TextStyle(fontSize: 50),),
                            )
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Personalizar", style: TextStyle(fontSize: 50),),
                          )
                      ),
                    ],
                ),
              ),
            )
          )
        ]),
    );
  }
}

void _showLoggin(BuildContext context) {
  Navigator.of(context).pushNamed('/loggin');
}