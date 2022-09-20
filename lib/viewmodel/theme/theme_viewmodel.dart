import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xff181C28),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF48A0EB))
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
