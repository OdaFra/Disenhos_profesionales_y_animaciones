import 'package:flutter/material.dart';

class GraficaCircularesPage extends StatefulWidget {
  const GraficaCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficaCircularesPage> createState() => _GraficaCircularesPageState();
}

class _GraficaCircularesPageState extends State<GraficaCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10.0;
            if (porcentaje > 100.0) {
              porcentaje = 0.0;
            }
          });
        },
      ),
      body: Center(
        child: Text(
          '$porcentaje %',
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
