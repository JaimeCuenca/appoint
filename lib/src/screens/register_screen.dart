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
  String userName, email, password, secPass;
  bool existUser = false;

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
                        colors: [Colors.red[100], Colors.red[200]]
                    )
                ),
                child: Column(
                    children:[
                      Image.asset("assets/images/logo.png")
                    ]
                ),
              ),
              Transform.translate(
                offset: Offset(0, 0),
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
                            onChanged: (value){
                              setState(() {
                                userName = value;
                              });
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
                            onChanged: (value){
                              setState(() {
                                email = value;
                              });
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
                            onChanged: (value){
                              setState(() {
                                password = value;
                              });
                            },
                            validator: (cont) {
                              if (cont.isEmpty)
                                return "Campo obligatorio";
                            },
                            obscureText: true,
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Repita contraseña:"),
                            validator: (cont) {
                              if (cont != password)
                                return "Las contraseñas no coinciden";
                            },
                            obscureText: true,
                          ),

                          ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(loading)
                                  SizedBox(
                                      height: 15,
                                      child: CircularProgressIndicator(strokeWidth: 6, backgroundColor: Colors.red,)
                                  )
                                else
                                  Text("Registrarse", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () {
                              _registerOnPressed(context, userName, email, password);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
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
    Navigator.of(context).pushNamed('/home', arguments: widget.userCont);
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
      if(_formKey.currentState.validate()){
        int index = widget.userCont.findUser(userName, email, password);
        if (index == -1) {
          setState(() {
            loading = false;
            existUser = false;
          });
          widget.userCont.addUser(User(userName, password, email, widget.userCont.users.length));
          widget.userCont.userLogged = widget.userCont.getUser(widget.userCont.findUser(userName, email, password));
          print("%%%%%%%%%%%"+widget.userCont.userLogged.name);
          widget.userCont.logged = true;
          Navigator.of(context).pushNamed("/home", arguments: widget.userCont);
        } else {
          setState(() {
            loading = false;
            existUser = true;
          });
        }
      }else{
        setState(() {
          loading = false;
          existUser = false;
        });
      }
    }
  }
}