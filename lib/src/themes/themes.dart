import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{

  bool _darKTheme = false;
  bool _customTheme=false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darKTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;


ThemeChanger(int theme){
  
  switch (theme) {
    case 1:
      _darKTheme = false;
      _customTheme=false;
      _currentTheme=ThemeData.light();
      break;

      case 2:
      _darKTheme = true;
      _customTheme=false;
      _currentTheme=ThemeData.dark();
      break;

      
      case 3:
      _darKTheme = false;
      _customTheme=true;
      break;
      
      default:
      _darKTheme = false;
      _customTheme=false;
      _currentTheme=ThemeData.light();
  }

}


  set darkTheme (bool value){
    _customTheme=false;
    _darKTheme=value;

    if(value){
      _currentTheme = ThemeData.dark();
    }else{
      _currentTheme=ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme (bool value){
    _darKTheme=false;
    _customTheme=value;
    
    if(value){
      _currentTheme = ThemeData.light();
    }else{
      _currentTheme=ThemeData.light();
    }
    notifyListeners();
  }
}