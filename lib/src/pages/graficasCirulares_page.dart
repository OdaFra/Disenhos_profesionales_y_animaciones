// ignore: file_names
import 'package:disenos_app/src/widgets/radialProgress.dart';
import 'package:flutter/material.dart';

class GraficaCircularesPage extends StatefulWidget {
  const GraficaCircularesPage({Key key}) : super(key: key);

  @override
  State<GraficaCircularesPage> createState() => _GraficaCircularesPageState();
}

class _GraficaCircularesPageState extends State<GraficaCircularesPage> {
  double porcentaje = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 5;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.blue,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.purple,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.red,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({ this.porcentaje,  this.color});

  final Color color;
  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: size.height * 0.085,
          top: size.width * 0.20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$porcentaje %',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 180,
          height: 180,
          child: RadialProgress(
            porcentaje: porcentaje,
            colorPrimario: color,
            colorSecundario: Colors.grey,
            grosorSecundario: 8,
            grosorPrimario: 12,
          ),
          //child: Text('$porcentaje %', style: const TextStyle(fontSize: 50)),
        ),
      ],
    );
  }
}
