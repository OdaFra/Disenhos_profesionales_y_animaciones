import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;

  @override
  void initState() {
    // ignore: unnecessary_new
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      //controller
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.75,
            1,
            curve: Curves.easeOut,
          )
          //Curves.easeInOut,
          ),
    );

    controller.addListener(() {
      print('Status:  ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
      // else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play / Reproducir
    controller.forward();

    return AnimatedBuilder(
      child: _Rectangulo(),
      animation: controller,
      builder: (BuildContext context, Widget? childRectangulo) {
        //print('rotacion: ' + rotacion.value.toString());
        return Transform.rotate(
          angle: rotacion.value,
          child: Opacity(
            opacity: opacidad.value,
            child: childRectangulo,
          ),
          //    child: _Rectangulo(),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.blue.shade700),
    );
  }
}
