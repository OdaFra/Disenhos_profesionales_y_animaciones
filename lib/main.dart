import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
//import 'package:disenos_app/src/pages/graficasCirulares_page.dart';
//import 'package:disenos_app/src/labs/circularProgress_page.dart';
//import 'package:disenos_app/src/retos/cuadradoAnimado_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Diseños APP',
        debugShowCheckedModeBanner: false,
        home: SlideShowPage());
  }
}
