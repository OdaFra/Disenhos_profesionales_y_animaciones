import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: const BoxDecoration(
            color: Color(0xff615AAB),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))));
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.09,
      child: Container(
        height: 300,
        width: double.infinity,
        color: Color(0xff615AAB),
      ),
    );
  }
}
