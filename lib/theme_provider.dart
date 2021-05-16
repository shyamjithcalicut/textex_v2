import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppThemes {
  bool isDarkTheme = false;
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade800,
    colorScheme: ColorScheme.dark(),
    focusColor: Colors.green,
    hoverColor: Colors.green,
    accentColor: Colors.green,
    accentIconTheme: IconThemeData(color: Colors.green),
    highlightColor: Colors.green,
    primaryColor: Colors.grey.shade800,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade800,
    ),
    cardColor: Colors.grey.shade800,
    primaryColorBrightness: Brightness.dark,
    cardTheme: CardTheme(
      color: Colors.grey.shade800,
    ),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    focusColor: Colors.green,
    hoverColor: Colors.green,
    accentColor: Colors.green,
    accentIconTheme: IconThemeData(color: Colors.green),
    highlightColor: Colors.green,
    primaryColor: Colors.green,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    cardColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    cardTheme: CardTheme(
      color: Colors.white,
    ),

    // scaffoldBackgroundColor: Colors.white,
    // colorScheme: ColorScheme.light(),
    // focusColor: Colors.green,
    // hoverColor: Colors.green,
    // accentColor: Colors.green,
    // accentIconTheme: IconThemeData(color: Colors.green),
    // highlightColor: Colors.green,
    // primaryColor: Colors.white,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: Colors.white,
    // ),
    // cardColor: Colors.white,
    // primaryColorBrightness: Brightness.light,
    // cardTheme: CardTheme(
    //   color: Colors.white,
    // ),
  );
}
