import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonGordoPage extends StatelessWidget {
  final IconData icon;
  @required
  final String texto;
  final Color color1;
  final Color color2;
  @required
  final Function onPress;

  ButtonGordoPage({
    this.icon = FontAwesomeIcons.circle,
    this.texto,
    this.color1 = Colors.grey,
    this.color2 = Colors.blue,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(children: [
        _ButtonGordBackground(this.icon, this.color1, this.color2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            SizedBox(
              height: 140,
              width: 40,
            ),
            FaIcon(this.icon, size: 40, color: Colors.white),
        
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(this.texto,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          
            FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
      
            SizedBox(
              width: 40,
            ),
          ],
        )
      ]),
    );
  }
}

class _ButtonGordBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _ButtonGordBackground(
    this.icon,
    this.color1,
    this.color2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned(
              right: -20,
              top: -20,
              child: FaIcon(this.icon,
                  size: 150, color: Colors.white.withOpacity(0.2)))
        ]),
      ),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        // color: Colors.indigo,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[this.color1, this.color2],
        ),
      ),
    );
  }
}
