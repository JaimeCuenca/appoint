import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  BuildContext context;

  GalleryScreen(this.context, {Key key}) : super(key: key);

  _GalleryScreenState createState() => _GalleryScreenState();
}

class  _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.home_outlined, color: Colors.white,),
        onPressed: (){_showHome(context);},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: [
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),
            GestureDetector(onTap: () {showDialog(context: context, builder: (context){return Image.asset("assets/images/edittattoo.png");},);}, child: Image.asset("assets/images/edittattoo.png")),

          ],
        ),
      ),
    );
  }
}

void _showHome(BuildContext context) {
  Navigator.of(context).pushNamed('/');
}