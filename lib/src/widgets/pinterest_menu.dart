import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<PinterestButton> items = [
      PinterestButton(
          icon: Icons.pie_chart,
          onPressed: () {
            print('Icon pie_chart');
          }),
          PinterestButton(
          icon: Icons.search,
          onPressed: () {
            print('Icon search');
          }),
          PinterestButton(
          icon: Icons.notifications,
          onPressed: () {
            print('Icon notifications');
          }),
           PinterestButton(
          icon: Icons.supervised_user_circle,
          onPressed: () {
            print('Icon supervised_user_circle');
          })
    ];
    return Center(
      child: Container(
        child:_MenuItems(items),
        width: 250,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: Colors.black38,
              // offset: Offset(10,10),
              blurRadius: 10,
              spreadRadius: -5
            )
          ]
        ),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

 final List<PinterestButton> menuItems;

   _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i]))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
 final int index;
 final PinterestButton items;

   _PinterestMenuButton(this.index, this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(items.icon),
    );
  }
}