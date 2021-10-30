import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _theme = ThemeMode.system;

  ThemeMode get theme => _theme;

  bool get isDarkMode => _theme == ThemeMode.dark;

  void toggleDarkMode() {
    if (_theme == ThemeMode.dark) {
      _theme = ThemeMode.light;
    } else {
      _theme = ThemeMode.dark;
    }
    notifyListeners();
  }
}
