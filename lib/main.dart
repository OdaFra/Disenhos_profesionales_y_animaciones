import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
import 'package:disenos_app/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/models/layout_model.dart';

// import 'src/pages/sliverList_page.dart';
// import 'package:disenos_app/src/pages/emergency_page.dart';
// import 'package:disenos_app/src/pages/pinterest_page.dart';
// import 'package:disenos_app/src/pages/slideShow_page.dart';
// import 'package:disenos_app/src/pages/graficasCirulares_page.dart';
// import 'package:disenos_app/src/labs/slideshow_page.dart';
// import 'package:disenos_app/src/labs/circularProgress_page.dart';
// import 'package:disenos_app/src/retos/cuadradoAnimado_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(2),
        ),
        ChangeNotifierProvider(
          create: (_)=> LayoutModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      title: 'Diseños APP',
      debugShowCheckedModeBanner: false,
      home: //LauncherPage());
          OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('En que orientación estoy${orientation}');
          // return LauncherPage();
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
