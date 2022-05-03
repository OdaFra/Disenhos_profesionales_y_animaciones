import 'package:disenos_app/src/retos/cuadradoAnimado_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Diseños APP',
        debugShowCheckedModeBanner: false,
        home: CuadradoAnimadoPage());
  }
}
