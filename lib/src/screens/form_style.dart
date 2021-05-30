import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class FormStyleScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;
  String style = "SIN ELECCION";

  FormStyleScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _FormStyleScreenState createState() => _FormStyleScreenState();
}

class _FormStyleScreenState extends State<FormStyleScreen> {

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
              gradient: LinearGradient(
                  colors: [Colors.red[100], Colors.red[200]]
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(0, -15),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
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
                              Text("ESTILO",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 40)),
                              SizedBox(height: 10,),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Elige el estilo que más te guste",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red, fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    _select("REALISMO");
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(width: 50,),
                                      Text("REALISMO", style: TextStyle(fontSize: 20, color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Image.asset("assets/images/realismo.png", height: 100,),
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _select("TRADICIONAL");
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(width: 50,),
                                      Text("TRADICIONAL", style: TextStyle(fontSize: 20, color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Image.asset("assets/images/tradicional.png", height: 100,),
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _select("DOTWORK");
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(width: 50,),
                                      Text("DOTWORK", style: TextStyle(fontSize: 20, color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Image.asset("assets/images/dotwork.png", height: 149, color: Colors.black,),
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _select("JAPONES");
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(width: 50,),
                                      Text("JAPONES", style: TextStyle(fontSize: 20, color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Image.asset("assets/images/japones.png", height: 100,),
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _select("ACUARELA");
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(width: 50,),
                                      Text("ACUARELA", style: TextStyle(fontSize: 20, color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Image.asset("assets/images/acuarela.png", height: 140,),
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _select("BLACKWORK");
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(width: 50,),
                                      Text("BLACKWORK", style: TextStyle(fontSize: 20, color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Image.asset("assets/images/blackwork.png", height: 100,),
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _select("LINEAL");
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(width: 50,),
                                      Text("LINEAL", style: TextStyle(fontSize: 20, color: Colors.black),),
                                      SizedBox(width: 20,),
                                      Image.asset("assets/images/linea.png", height: 100, color: Colors.black,),
                                    ],
                                  )
                              ),
                            ])
                        ),
                      ),

                      SizedBox(height: 10,),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 200, height: 50),
                        child: ElevatedButton(
                            onPressed: (){_showNext(context);},
                            child: Text(widget.style,
                            style: TextStyle(color: Colors.white, fontSize: 25)),
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
    if(widget.style!="SIN ELECCION") {
      widget.userCont.userLogged.tattooOnCreated.style = widget.style;
      Navigator.of(context).pushNamed('/form_zone', arguments: widget.userCont);
    }
  }

  void _select(String s) {
    setState(() {
      widget.style = s;
    });
  }

  void _showBack(BuildContext context) {
    Navigator.of(context).pushNamed('/edit', arguments: widget.userCont);}
}