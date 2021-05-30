import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class FormTamColorScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  FormTamColorScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _FormTamColorScreenState createState() => _FormTamColorScreenState();
}

class _FormTamColorScreenState extends State<FormTamColorScreen> {
  bool color = false,
      bn = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String h = "0",
      a = "0";
  String tam = "SIN ELECCION";

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
                          height: 150,
                          child: Column(
                            children: [
                              Text("TAMAÑO Y COLOR",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 40)),
                              SizedBox(height: 10,),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Elige el tamaño y el color de tu tatuaje",
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
                            decoration: InputDecoration(labelText: "Altura:"),
                            onChanged: (value) {
                              setState(() {
                                h = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Campo obligatorio";
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Anchura:"),
                            onChanged: (value) {
                              setState(() {
                                a = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Campo obligatorio";
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Checkbox(
                                  value: color,
                                  onChanged: (value) {
                                    setState(() {
                                      color = true;
                                      bn = false;
                                    });
                                  }),
                              Text("Color")
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Checkbox(
                                  value: bn,
                                  onChanged: (value) {
                                    setState(() {
                                      color = false;
                                      bn = true;
                                    });
                                  }),
                              Text("Blanco y negro")
                            ],
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            onPressed: () {
                              _siguiente();
                            },
                            child: h == "0" || a == "0" || (!bn && !color) ? Text("SIN RELLENAR") : Text(
                                _textoBoton()),
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

  String _textoBoton() {
    return calcTam().toString() + " cm²" + (color ? " / COLOR" : " / ByN");
  }

  calcTam() {
    return ((int.parse(h) + int.parse(a)) / 2).toString();
  }

  void _showBack(BuildContext context) {
    Navigator.of(context).pushNamed('/form_zone', arguments: widget.userCont);
  }

  void _siguiente() {
    if (_formKey.currentState.validate() && (color || bn)) {
      if(double.parse(calcTam())<5)
        widget.userCont.userLogged.tattooOnCreated.size = "<5";
      else{
        if(double.parse(calcTam())<10)
          widget.userCont.userLogged.tattooOnCreated.size = "5-10";
        else{
          if(double.parse(calcTam())<20)
            widget.userCont.userLogged.tattooOnCreated.size = "10-20";
          else{
            if(double.parse(calcTam())<40)
              widget.userCont.userLogged.tattooOnCreated.size = "20-40";
            else{
              if(double.parse(calcTam())<60)
                widget.userCont.userLogged.tattooOnCreated.size = "40-60";
              else
                widget.userCont.userLogged.tattooOnCreated.size = ">60";
            }
          }
        }
      }
      widget.userCont.userLogged.tattooOnCreated.bn = bn;
      Navigator.of(context).pushNamed('/form_desc', arguments: widget.userCont);
    }
  }
}