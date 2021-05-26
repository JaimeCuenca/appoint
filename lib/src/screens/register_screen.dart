import 'dart:io';

import 'package:appoint/src/connection/users.dart';
import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  RegisterScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _ReegisterScreenState createState() => _ReegisterScreenState();
}

class _ReegisterScreenState extends State<RegisterScreen> {
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName, email, password;
  bool existUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.home_outlined, color: Colors.white,),
              onPressed: (){_showHome(context);},
            ),
            SizedBox(height: 5,),
            FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.arrow_back_rounded, color: Colors.white,),
              onPressed: (){_showLog(context);},
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
                        colors: [Colors.deepPurple[300], Colors.pink[200]]
                    )
                ),
                child: Column(
                    children:[
                      SizedBox(height: 70),
                      Text(
                        "Nuevo Usuario",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
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
                            decoration: InputDecoration(labelText: "Email:"),
                            onSaved: (value){
                              email = value;
                            },
                            validator: (value){
                              if(value.isEmpty){
                                return "Campo obligatorio";
                              }else{
                                if(!value.contains('@') || !value.contains('.'))
                                  return "Email invalido";
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Contraseña:"),
                            onSaved: (cont){
                              password = cont;
                            },
                            validator: (cont) {
                              if (cont.isEmpty)
                                return "Campo obligatorio";
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
                                  Text("Registrarse", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () {
                              _registerOnPressed(context, userName, email, password);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple[300]),
                            ),
                          ),
                          SizedBox(height: 5,),
                          if(existUser)
                            Text("Usuario ya registrado", style: TextStyle(color: Colors.red),),
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
    Navigator.of(context).pushNamed('/', arguments: widget.userCont);
  }
  void _showLog(BuildContext context) {
    Navigator.of(context).pushNamed('/loggin', arguments: widget.userCont);
  }

  void _registerOnPressed(BuildContext context, String userName, String email, String password) async{
    if(!loading) {
      setState(() {
        loading = true;
        existUser = false;
      });
      sleep(Duration(seconds: 3));
      if(_formKey.currentState.validate()){
        print("SI QUE VALIDA EL FORM ***********************************************************************************************");
        int index = widget.userCont.findUser(userName);
        if (index == -1) {
          print("NO ENCUNETRA EL USER ***********************************************************************************************");
          widget.userCont.addUser(User(userName, password, email, widget.userCont.users.length));
          print("añade EL USER ***********************************************************************************************");
          widget.userCont.userLogged = widget.userCont.getUser(widget.userCont.findUser(userName)+1);
          widget.userCont.logged = true;
          Navigator.of(context).pushNamed("/", arguments: widget.userCont);
          setState(() {
            loading = false;
            existUser = false;
          });
        } else {
          print("ENCUENTRA EL USER ***********************************************************************************************");
          setState(() {
            loading = false;
            existUser = true;
          });
        }
      }else{
        print("NO QUE VALIDA EL FORM ***********************************************************************************************");
        setState(() {
          loading = false;
          existUser = false;
        });
      }
    }
  }
}