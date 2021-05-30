import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class FormDescScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  FormDescScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _FormDescScreenState createState() => _FormDescScreenState();
}

class _FormDescScreenState extends State<FormDescScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String desc = "SIN DESCRIPCION";

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
        body: Form(
          key: _formKey,
          child: Stack(
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
                          height: 130,
                          child: Column(
                            children: [
                              Text("DESCRIPCIÓN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 40)),
                              SizedBox(height: 10,),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Aporta una breve descripción del diseño que quieres para el tatuaje",
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
                          horizontal: 25, vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: "Descripcion:"),
                            onChanged: (value) {
                              setState(() {
                                desc = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Campo obligatorio";
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            onPressed: () {
                              _siguiente();
                            },
                            child: desc.isEmpty? Text("SIN RELLENAR") : Text("SIGUIENTE"),
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
            ],),
        )
    );
  }

  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed('/home', arguments: widget.userCont);
  }

  void _showBack(BuildContext context) {
    Navigator.of(context).pushNamed('/form_tam_color', arguments: widget.userCont);
  }

  void _siguiente() {
    if (_formKey.currentState.validate()) {
      widget.userCont.userLogged.tattooOnCreated.desc = desc;
      Navigator.of(context).pushNamed('/form_result', arguments: widget.userCont);
    }
  }
}