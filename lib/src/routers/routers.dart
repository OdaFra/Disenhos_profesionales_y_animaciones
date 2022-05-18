import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/emergency_page.dart';
import '../pages/graficasCirulares_page.dart';
import '../pages/header_page.dart';
import '../pages/pinterest_page.dart';
import '../pages/slideshow_page.dart';
import '../pages/sliverList_page.dart';
import '../retos/cuadradoAnimado_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slidershow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeardesPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de Progreso', GraficaCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
