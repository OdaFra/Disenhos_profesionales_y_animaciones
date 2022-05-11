import 'package:disenos_app/src/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:_HeaderPage()
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