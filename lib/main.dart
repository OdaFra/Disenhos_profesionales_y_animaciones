import 'package:flutter/material.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
//import 'package:disenos_app/src/pages/pinterest_page.dart';
//import 'package:disenos_app/src/pages/slideShow_page.dart';
//import 'package:disenos_app/src/pages/graficasCirulares_page.dart';
//import 'package:disenos_app/src/labs/slideshow_page.dart';
//import 'package:disenos_app/src/labs/circularProgress_page.dart';
//import 'package:disenos_app/src/retos/cuadradoAnimado_page.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Diseños APP',
        debugShowCheckedModeBanner: false,
        home: EmergencyPage());
  }
}
