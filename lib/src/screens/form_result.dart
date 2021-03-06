import 'package:appoint/src/connection/users.dart';
import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FormResultScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  FormResultScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _FormResultScreenState createState() => _FormResultScreenState();
}

class _FormResultScreenState extends State<FormResultScreen> {
  @override
  Widget build(BuildContext context) {
    widget.userCont = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.home_outlined, color: Colors.white,),
              onPressed: () {
                _showHome(context);
              },
            ),
            SizedBox(height: 5,),
            FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.arrow_back_rounded, color: Colors.white,),
              onPressed: () {
                _showBack(context);
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red[900], Colors.red[200]]
                  )
              ),
              child: Column(
                children: [
                  Card(
                    color: Colors.red[50],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 135,
                        child: Column(
                          children: [
                            Text("RESUMEN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 40)),
                            SizedBox(height: 10,),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Aqu?? podr??s ver un resumen de tu tatuaje m??s el tiempo y el presupuesto estimados",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70,),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -15),
              child: SingleChildScrollView(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 240, bottom: 20),
                  child:
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align( alignment: Alignment.centerLeft, child: Text("ESTILO: " + widget.userCont.userLogged.tattooOnCreated.style)),
                        SizedBox(height: 5),
                        Align( alignment: Alignment.centerLeft, child: Text("ZONA: " + widget.userCont.userLogged.tattooOnCreated.zone)),
                        SizedBox(height: 5),
                        Align( alignment: Alignment.centerLeft, child: Text("TAMA??O: " + widget.userCont.userLogged.tattooOnCreated.size + "cm??") ),
                        SizedBox(height: 5),
                        Align( alignment: Alignment.centerLeft, child: Text("COLOR: " + (widget.userCont.userLogged.tattooOnCreated.bn? "BLANCO Y NEGRO" : "COLOR"))),
                        SizedBox(height: 5),
                        Align( alignment: Alignment.centerLeft, child: Text("DESCRIPCION: " + widget.userCont.userLogged.tattooOnCreated.desc)),
                        SizedBox(height: 5),
                        Align( alignment: Alignment.centerLeft, child: Text("TIEMPO ESTIMADO: " + widget.userCont.userLogged.tattooOnCreated.setTime())),
                        SizedBox(height: 5),
                        Align( alignment: Alignment.centerLeft, child: Text("PRESUPUESTO ESTIMADO: " + widget.userCont.userLogged.tattooOnCreated.setPrice() +"???")),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _enviar(widget.userCont.userLogged);
                          },
                          child: Text("ENVIAR"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black),
                          ),
                        ),
                      ],),
                  ),
                ),
              ),
            )
          ],)
    );
  }

  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed('/home', arguments: widget.userCont);
  }

  void _showBack(BuildContext context) {
    Navigator.of(context).pushNamed('/form_desc', arguments: widget.userCont);
  }

  Future<void> _enviar(User user) async {
    Email email = Email(
      body: "Usuario: ${user.email}\n"
          "Nombre: ${user.name}\n"
          "Estilo: ${user.tattooOnCreated.style}\n"
          "Tama??o: ${user.tattooOnCreated.size}\n"
          "Zona: ${user.tattooOnCreated.zone}\n"
          "Blanco y negro: ${user.tattooOnCreated.bn}\n"
          "Descripcion: ${user.tattooOnCreated.desc}\n"
          "Tiempo: ${user.tattooOnCreated.time}\n"
          "Precio: ${user.tattooOnCreated.price}\n\nComentarios extra para el tatuador: ",
      subject: "NUEVO TATTOO",
      recipients: ["jaime.cuenca.caro@gmail.com"]
    );
    await FlutterEmailSender.send(email);
    _showHome(context);
  }
}