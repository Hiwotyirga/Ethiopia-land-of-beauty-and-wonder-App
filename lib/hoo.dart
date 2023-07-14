import 'package:comment_box/comment/test.dart';
import 'package:exhange_rates_flutter/utils/home%20page.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp1(),

));
class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    MyApp:MyApp();
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
      image: DecorationImage(
      image: NetworkImage(
        "https://www.shutterstock.com/image-illustration/3d-render-abstract-multicolor-spectrum-260nw-1911508255.jpg",
      ),
      fit: BoxFit.cover,
    ),
    ),
    child: BackdropFilter(
    filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    child: Container(color: Colors.black.withOpacity(0.5)),
    ),
      ),

    );
  }
}


