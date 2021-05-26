import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  LoginScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false, isUser = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName;
  String password;

  @override
  Widget build(BuildContext context) {
    widget.userCont = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
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
                        onPressed: (){_registerOnPressed(context, userName, password);},
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
                      Row(children:
                          [if(!isUser)
                            Text("Usuario no encontrado", style: TextStyle(color: Colors.red),),
                          ],
                      ),
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
    Navigator.of(context).pushNamed('/register', arguments: widget.userCont);
  }
  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed('/', arguments: widget.userCont);
  }
  void _registerOnPressed(BuildContext context, String userName, String password) async {
    if (!loading) {
      setState(() {
        loading = true;
        isUser = true;
      });
      if (_formKey.currentState.validate()) {
        print(
            "SI QUE VALIDA EL FORM ***********************************************************************************************");
        int index = widget.userCont.findUser(userName);
        if (index != -1) {
          print(
              "SI QUE ENCUENTRA EL USER ***********************************************************************************************");
          setState(() {
            loading = false;
            isUser = true;
          });
          widget.userCont.userLogged = widget.userCont.getUser(index);
          widget.userCont.logged = true;
          Navigator.of(context).pushNamed("/", arguments: widget.userCont);
        } else {
          print(
              "NO ENCUENTRA EL USER ***********************************************************************************************");
          setState(() {
            loading = false;
            isUser = false;
          });
        }
      } else {
        print(
            "NO QUE VALIDA EL FORM ***********************************************************************************************");
        setState(() {
          loading = false;
          isUser = true;
        });
      }
    }
  }
}