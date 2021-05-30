import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;
  EditScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  @override
  Widget build(BuildContext context) {
    widget.userCont = ModalRoute.of(context).settings.arguments ;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.home_outlined, color: Colors.white,),
        onPressed: (){_showHome(context);},
      ),
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red[900], Colors.red[200]]
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(0, -15),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 80,),
                      Card(
                        color: Colors.red[50],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("¡HOLA "+widget.userCont.userLogged.name.toUpperCase()+"!",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 40)),
                              SizedBox(height: 10,),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Rellenando el siguiente cuestionario\npodrás diseñar y obtener\nlos datos sobre tu tattoo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red[800], fontSize: 15)),
                                ),
                              ),],
                          ),
                        ),
                      ),
                      Image.network('https://media.giphy.com/media/YkK7K2KfORQmojt7Rg/giphy.gif'),
                      SizedBox(height: 20,),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 200, height: 70),
                        child: ElevatedButton(
                            onPressed: (){_showNext(context);},
                            child: Text("EMPEZAR",
                            style: TextStyle(color: Colors.white, fontSize: 30)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                        ),),
                      )],
                  ),
                ),
              )
          )]
      ),
    );
  }
  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed('/home', arguments: widget.userCont);
  }

  void _showNext(BuildContext context) {
    Navigator.of(context).pushNamed('/form_style', arguments: widget.userCont);
  }
}