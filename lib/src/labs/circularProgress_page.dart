// ignore: file_names
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CircularProgressPage extends StatefulWidget {
  

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
   AnimationController controller;
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    controller.addListener(() {
      //print('Valor controller: ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.refresh_outlined,
        ),
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);

          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          // color: Colors.red,
          padding: const EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MiRadialProgess(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgess extends CustomPainter {
  // ignore: prefer_typing_uninitialized_variables
  final porcentaje;
  _MiRadialProgess(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //Parte que se debera llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
