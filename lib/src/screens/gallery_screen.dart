import 'package:appoint/src/controller/user_controller.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  BuildContext context;
  UserController userCont;

  GalleryScreen(this.context, this.userCont, {Key key}) : super(key: key);

  _GalleryScreenState createState() => _GalleryScreenState();
}

class  _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.home_outlined, color: Colors.white,),
        onPressed: (){_showHome(context);},
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red[900], Colors.red[200]]
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              children: [
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/woody.jpeg");},);}, child: Image.asset("assets/images/woody.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/trustnoone.jpeg");},);}, child: Image.asset("assets/images/trustnoone.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/tiburon.jpeg");},);}, child: Image.asset("assets/images/tiburon.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/polilla.jpeg");},);}, child: Image.asset("assets/images/polilla.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/ojotormenta.jpeg");},);}, child: Image.asset("assets/images/ojotormenta.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/llaves.jpeg");},);}, child: Image.asset("assets/images/llaves.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/libro.jpeg");},);}, child: Image.asset("assets/images/libro.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/friends.jpeg");},);}, child: Image.asset("assets/images/friends.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/enfermera.jpeg");},);}, child: Image.asset("assets/images/enfermera.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/empatia.jpeg");},);}, child: Image.asset("assets/images/empatia.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/concha.jpeg");},);}, child: Image.asset("assets/images/concha.jpeg")),
                GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/carta.jpeg");},);}, child: Image.asset("assets/images/carta.jpeg")),
              ],
            ),
        ),
        ]
      ),
    );
  }
  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed('/home', arguments: widget.userCont);
  }
}