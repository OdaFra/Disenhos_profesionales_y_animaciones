import 'package:disenos_app/src/widgets/button_gordo.dart';
import 'package:disenos_app/src/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.red,
      body:Center(child: ButtonGordoPage(
        texto: 'Motor Accident',
        onPress: (){ print('Click!!!');},
        icon: FontAwesomeIcons.carCrash,
        color1: Color(0xff6989f5),
             color2:Color(0xff906ef5)

      ))
   );
  }
}

class _HeaderPage extends StatelessWidget {
  const _HeaderPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz solicitado',
      titulo: 'Asistencia médica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}