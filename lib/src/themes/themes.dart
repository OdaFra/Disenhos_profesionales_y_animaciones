import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darKTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darKTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darKTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        break;

      case 2:
        _darKTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
        break;

      case 3:
        _darKTheme = false;
        _customTheme = true;
        break;

      default:
        _darKTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darKTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darKTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          accentColor: Color(0xff48a0eb),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202b),
          textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white))
          //textTheme.bodyText1.color:

          );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
