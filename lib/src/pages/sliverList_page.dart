// ignore: file_names
import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _Titulo()
      //body: _ListViewTareas(),
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _ButtonNewList())
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
        color: Color(0xffED6762),
          child: const Text(
            'Create New List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          onPressed: () {}),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola Mundo'),
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minheight: 170,
                maxheight: 200,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: _Titulo(),
                ))),

        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 100,
          )
        ])),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minheight,
    @required this.maxheight,
    @required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxheight;
  //(minheight> maxheight) ? minheight:maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text('New',
              style: TextStyle(color: Color(0xff532128), fontSize: 50)),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: Color(0xfff7cdd5),
              ),
            ),
            Container(
              child: const Text('List',
                  style: TextStyle(
                      color: Color(0xffd93a30),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }
}

class _ListViewTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(titulo,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    );
  }
}
