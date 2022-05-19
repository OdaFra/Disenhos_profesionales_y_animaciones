// ignore_for_file: use_key_in_widget_constructors

import 'package:disenos_app/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        // body: PinterestMenu()
        //PinterestGird(),
        body: Stack(children: [
          PinterestGird(),
          _PinterestMenuLocation(),
        ]),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final bool mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
        bottom: 30,
        // ignore: sized_box_for_whitespace
        child: Container(
            width: widthPantalla,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                PinterestMenu(
                  mostrar: mostrar,
                  backgroundColor: appTheme.scaffoldBackgroundColor,
                  activeColor: appTheme.accentColor,
                  // inactiveColor: Colors.blueGrey,
                  items: [
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
                  ],
                ),
                const Spacer()
              ],
            )));
  }
}

class PinterestGird extends StatefulWidget {
  @override
  State<PinterestGird> createState() => _PinterestGirdState();
}

class _PinterestGirdState extends State<PinterestGird> {
  final List<int> items = List.generate(100, (index) => 1);
  ScrollController scrollController = ScrollController();
  double scrollAnterior = 0.0;

  @override
  void initState() {
    scrollController.addListener(() {
      //print('Scroll Listener ${scrollController.offset}');
      if (scrollController.offset > scrollAnterior &&
          scrollController.offset > 150) {
        // print('Ocultar Menu');
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        //print('Mostrar Menu');
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = scrollController.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return 
    // GridView.custom(
    //   gridDelegate: SliverQuiltedGridDelegate(
    //     crossAxisCount: count,
    //     mainAxisSpacing: 4,
    //     crossAxisSpacing: 4,
    //     repeatPattern: QuiltedGridRepeatPattern.inverted,
    //     pattern: const [
    //       QuiltedGridTile(3, 2),
    //       QuiltedGridTile(2, 2),
    //     ],
    //   ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) => _PinterestItems(index),
    //     childCount: items.length
    //   ),
    // );
    StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItems(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }
}

class _PinterestItems extends StatelessWidget {
  final int index;

  const _PinterestItems(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;
  bool get mostrar => _mostrar;
  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
