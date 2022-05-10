import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  const PinterestMenu(
      {Key key,
      this.mostrar = true,
      this.backgroundColor,
      this.activeColor,
      this.inactiveColor})
      : super(key: key);

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
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                // offset: Offset(10,10),
                blurRadius: 10,
                spreadRadius: -5)
          ]),
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
        children: List.generate(
            menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton items;

  _PinterestMenuButton(this.index, this.items);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        items.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(items.icon,
            size: itemSeleccionado == index ? 35 : 25,
            color: itemSeleccionado == index
                ? Colors.blue.shade500
                : Colors.blueGrey),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}

