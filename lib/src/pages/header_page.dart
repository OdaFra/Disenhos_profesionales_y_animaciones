import 'package:disenos_app/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/header.dart';

class HeardesPage extends StatelessWidget {
  const HeardesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(body:HeaderWave(color:accentColor,));
  }
}
