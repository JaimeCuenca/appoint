import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  HomeScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class  _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("HOME"),
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            title: widget.userCont.logged? Text(widget.userCont.userLogged.email):Text("Iniciar sesion") ,
          ),
          body: Align(
              alignment: Alignment.topCenter,
              child: widget.userCont.logged? Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset("assets/images/edittattoo.png", height: 100,),
              )
              :IconButton(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  iconSize: 200,
                  onPressed: () {_showLoggin(context);})
          )
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.only(left: 20, right: 20, top: 200, bottom: 20),
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {_showGallery(context);},
                              child: Column(
                                  children: [
                                    Container(child: Image(image: AssetImage("assets/images/galeria.png"), color: Colors.purple,), height: 130,),
                                    Text("GALERIA", style: TextStyle(fontSize: 50),),
                                  ]
                              ),
                            ),
                          ),
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(child: Image(image: AssetImage("assets/images/edittattoo.png"), color: Colors.purple,), height: 107, margin: const EdgeInsets.only(top: 20),),
                                Text("EDITAR", style: TextStyle(fontSize: 50),),
                              ]
                            ),
                          ),
                      ),
                    ],
                ),
              ),
            )
          )
        ]),
    );
  }
  void _showLoggin(BuildContext context) {
    Navigator.of(context).pushNamed('/loggin', arguments: widget.userCont);
  }

  void _showGallery(BuildContext context) {
    Navigator.of(context).pushNamed('/gallery');
  }
}