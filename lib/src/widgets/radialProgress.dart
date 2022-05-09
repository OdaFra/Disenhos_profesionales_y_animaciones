// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  const RadialProgress(
      { this.porcentaje,
      this.colorPrimario = Colors.indigo,
      this.colorSecundario = Colors.grey,
      this.grosorSecundario = 4,
      this.grosorPrimario = 5});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
   AnimationController controller;
   double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgess(
                  (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller.value),
                  widget.colorPrimario,
                  widget.colorSecundario,
                  widget.grosorSecundario,
                  widget.grosorPrimario),
            ),
          );
        });
  }
}

class _MiRadialProgess extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;
  _MiRadialProgess(this.porcentaje, this.colorPrimario, this.colorSecundario,
      this.grosorSecundario, this.grosorPrimario);

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect =Rect.fromCircle(center: const Offset(0,0), radius: 180);

    const Gradient gradiente = LinearGradient(colors: <Color>[
      Color(0xffc012FF),
      Color(0xff6D05e8),
      Colors.red
    ]);

    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
     // ..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      ..strokeCap =StrokeCap.round
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
