import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/pinterest_menu.dart';


class PinterestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: PinterestMenu()
      //PinterestGird(),
   );
  }
}

class PinterestGird extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List <int> items= List.generate(200, (index) => 1);
    return  StaggeredGridView.countBuilder(
      crossAxisCount:4,
      itemCount:items.length,
      itemBuilder:(BuildContext context, int index)=> _PinterestItems(index),
      staggeredTileBuilder:(int index) =>
      StaggeredTile.count(2, index.isEven ? 2:3 ),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItems extends StatelessWidget {
  
  final int index;

   _PinterestItems( this.index) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(

      color:Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      )
    );
  }
}