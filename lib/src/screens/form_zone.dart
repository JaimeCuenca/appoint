import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class FormZoneScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;
  String zone = "SIN ELECCION";

  FormZoneScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _FormZoneScreenState createState() => _FormZoneScreenState();
}

class _FormZoneScreenState extends State<FormZoneScreen> {

  @override
  Widget build(BuildContext context) {
    widget.userCont = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.home_outlined, color: Colors.white,),
            onPressed: (){_showHome(context);},
          ),
          SizedBox(height: 5,),
          FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.arrow_back_rounded, color: Colors.white,),
            onPressed: (){_showBack(context);},
          ),
        ],
      ),
      body: Stack(
        children:
        [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/humanbody.png"),
              ),
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
                      SizedBox(height: 45,),
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
                              Text("ZONA",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 40)),
                              SizedBox(height: 10,),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Elige la zona en la que te quieras tatuar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red, fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: Column(
                          children: [
                            SizedBox(height: 28,),
                            SizedBox(
                              height: 60,
                              width: 30,
                              child:
                                GestureDetector(
                                  onTap: (){
                                    _select("CABEZA");
                                  },
                                  child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 130,),
                                SizedBox(
                                  height: 60,
                                  width: 25,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("HOMBRO");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("PECHO/ESPALDA");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 33,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("HOMBRO");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 120,),
                                SizedBox(
                                  height: 60,
                                  width: 20,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("BRAZO");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                SizedBox(
                                  height: 60,
                                  width: 50,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("ABDOMEN");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                SizedBox(
                                  height: 60,
                                  width: 20,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("BRAZO");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                SizedBox(width: 145,),
                                SizedBox(
                                  height: 60,
                                  width: 20,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("MUSLO");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                SizedBox(
                                  height: 60,
                                  width: 20,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("MUSLO");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 137,),
                                SizedBox(
                                  height: 60,
                                  width: 20,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("PIERNA");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 45,),
                                SizedBox(
                                  height: 60,
                                  width: 20,
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      _select("PIERNA");
                                    },
                                    child:
                                    Card(
                                      color: Colors.transparent,
                                      child: Text(":        :", style: TextStyle(color: Colors.transparent),),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 215, height: 50),
                        child: ElevatedButton(
                            onPressed: (){_showNext(context);},
                            child: Text(widget.zone,
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                        ),),
                      )
                    ],
                  ),
                ),
              )
          )
        ]
      ),
    );
  }
  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed('/home', arguments: widget.userCont);
  }

  void _showNext(BuildContext context) {
    if(widget.zone!="SIN ELECCION") {
      widget.userCont.userLogged.tattooOnCreated.zone = widget.zone;
      Navigator.of(context).pushNamed(
          '/form_tam_color', arguments: widget.userCont);
    }
  }
  void _showBack(BuildContext context) {
    Navigator.of(context).pushNamed('/form_style', arguments: widget.userCont);}

  void _select(String s) {
    setState(() {
      widget.zone = s;
    });
  }
}