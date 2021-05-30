import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  HomeScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class  _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    widget.userCont = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text("NAUFRAGIO TATTOO"),
        ),
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            title: widget.userCont.logged? Text(widget.userCont.userLogged.email):Text("Iniciar sesion") ,
          ),
          body: Align(
              alignment: Alignment.topCenter,
              child: widget.userCont.logged? 
                Container(
                  color: Colors.black87,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/iconuser.png", height: 100, color: Colors.white, alignment: Alignment.topCenter,),
                            SizedBox(
                              height: 50,
                              child:
                                Column(
                                  children: [
                                    Text("!BIENVENIDO ", style: TextStyle(fontSize: 18, color: Colors.white)),
                                    Text(widget.userCont.userLogged.name+"!", style: TextStyle(fontSize: 18, color: Colors.white)),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      ElevatedButton(onPressed: (){_logOut();}, child: Text("SALIR", style: TextStyle(color: Colors.red)), style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                      ),),
                      SizedBox(height: 250,),
                      Image.asset("assets/images/contacto.png")
                    ],
                  ),
                )
                :Container(
                color: Colors.black87,
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_box_outlined, color: Colors.red,),
                        iconSize: 150,
                        onPressed: () {_showLoggin(context);}),
                      Text("¡Inicia sesión o regístrate para no perderte nada!", style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,),
                      SizedBox(height: 150,),
                      Image.asset("assets/images/contacto.png")
                    ],
                  ),
                )
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
                    colors: [Colors.red[900], Colors.red[200]]
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
                                    Container(child: Image(image: AssetImage("assets/images/galeria.png"), color: Colors.red,), height: 130,),
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
                            child: GestureDetector(
                              onTap: () {_showEdit(context);},
                              child: Column(
                                children: [
                                  Container(child: Image(image: AssetImage("assets/images/edittattoo.png"), color: Colors.red,), height: 70, margin: const EdgeInsets.only(top:40, left: 40, right: 40, bottom: 20),),
                                  Text("EDITAR", style: TextStyle(fontSize: 50),),
                                ]
                              ),
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
    Navigator.of(context).pushNamed('/gallery', arguments: widget.userCont);
  }

  void _logOut() {
    widget.userCont.logged = false;
    _showLoggin(context);
  }

  void _showEdit(BuildContext context) {
    if(widget.userCont.logged){
      Navigator.of(context).pushNamed('/edit', arguments: widget.userCont);
    }else{
      Fluttertoast.showToast(
        msg: "Debes iniciar sesón/Registrate para editar un diseño",
        gravity: ToastGravity.CENTER,);
      Navigator.of(context).pushNamed('/loggin', arguments: widget.userCont);
    }
  }
}