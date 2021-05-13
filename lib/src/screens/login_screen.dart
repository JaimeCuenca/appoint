import 'package:flutter/material.dart';
import 'package:appoint/src/connection/users.dart';
import 'package:hive/hive.dart';

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
                  "APPointment",
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
                        onPressed: () {
                          _loginOnPressed(context, userName, password);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple[300]),
                        ),
                      ),
                      SizedBox(height: 5,),
                      if(nonUser)
                        Text("Usuario o contraseña incorrectos", style: TextStyle(color: Colors.red),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿No estás registrado?"),
                          TextButton(
                              onPressed: () {
                                _showRergister(context);
                              },
                              child:
                              Text("Registrarse")
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

  void _loginOnPressed(BuildContext context, String userName, String password) async{
    if(!loading){
      if(!_findUser(User(userName, password))){
        setState(() {
          nonUser = true;
          loading = false;
        });
      }else{
        setState(() {
          nonUser = false;
          loading = false;
        });
        Navigator.of(context).pushReplacementNamed("/home");
      }
    }
  }

  void _showRergister(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }

  @override
  void initState() {
    super.initState();
  }

  bool _findUser(User user) {
    for (User u in Hive.box('users').values){
      if(u.name == user.name || u.email == user.email)
        return true;
      else
        return false;
    }
  }
}