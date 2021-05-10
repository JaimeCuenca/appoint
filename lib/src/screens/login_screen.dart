import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.cyan[300], Colors.cyan[800]]
              )
          ),
          child: Column(
              children:[
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
          offset: Offset(0, -30),
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 240, bottom: 20),
              child:
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Usuario:"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Contraseña:"),
                      obscureText: true,
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Iniciar sesion", style: TextStyle(color: Colors.white)),
                          if(loading)
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                              ),
                              height: 10,
                              width: 20,
                            )
                        ],
                      ),
                      onPressed: () {
                        _loginOnPressed(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan[300]),
                      ),
                    ),
                    SizedBox(height: 10,),
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
                  ],
                ),
              ),
            ),
          ),
        )
      ],)
    );
  }

  void _loginOnPressed(BuildContext context) {
    if(!loading){
      setState(() {
        loading = true;
      });
    }else{
      setState(() {
        loading = false;
      });
    }
  }

  void _showRergister(BuildContext context) {
    Navigator.of(context).pushNamed("/register");
  }

}