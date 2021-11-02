import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeProvider with ChangeNotifier {
  static const String DARK_MODE_KEY = 'IS_DARK_MODE';

  final GetStorage _box = GetStorage();
  ThemeMode? _theme;

  ThemeMode? get theme {
    if (_box.read<bool>(DARK_MODE_KEY) != null) {
      if (_box.read<bool>(DARK_MODE_KEY)!)
        _theme = ThemeMode.dark;
      else
        _theme = ThemeMode.light;
    }
    return _theme;
  }

  bool? get isDarkMode => _box.read<bool>(DARK_MODE_KEY);

  void toggleDarkMode(bool isDark) {
    if (isDark) {
      _theme = ThemeMode.light;
      _box.write(DARK_MODE_KEY, false);
    } else {
      _theme = ThemeMode.dark;
      _box.write(DARK_MODE_KEY, true);
    }
    notifyListeners();
  }
}
