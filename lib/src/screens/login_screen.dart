import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  BuildContext context;

  LoginScreen(this.context, {Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName;
  String password;
  bool nonUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home_outlined, color: Colors.white,),
        onPressed: (){_showHome(context);},
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
                    colors: [Colors.deepPurple[300], Colors.pink[200]]
                )
            ),
            child: Column(
                children:[
                  SizedBox(height: 70),
                  Text(
                  "APPoint",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50
                  ),
                )
              ]
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
                margin: const EdgeInsets.only(left: 20, right: 20, top: 240, bottom: 20),
                child:
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Usuario:"),
                        onSaved: (value){
                          userName = value;
                        },
                        validator: (value){
                          if(value.isEmpty){
                            return "Campo obligatorio";
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Contraseña:"),
                        onSaved: (value){
                          password = value;
                        },
                        validator: (value){
                          if(value.isEmpty){
                            return "Campo obligatorio";
                          }
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(loading)
                              SizedBox(
                                height: 15,
                                child: CircularProgressIndicator(strokeWidth: 6, backgroundColor: Colors.deepPurple,)
                              )
                            else
                              Text("Iniciar sesion", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple[300]),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿No estás registrado?"),
                          TextButton(
                              child:
                                Text("Registrarse"),
                              onPressed:() {
                                _showRergister(context);
                              },
                          )
                        ],
                      )
                    ],),
                ),
              ),
            ),
          )
        ],),
      )
    );
  }
  void _showRergister(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }
  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed('/');
  }
}