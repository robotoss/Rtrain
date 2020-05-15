import 'package:flutter/material.dart';

final ThemeData mainTheme = buildDefaultTheme();

ThemeData buildDefaultTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
        color: Colors.white,
        brightness: Brightness.light,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black)),
    scaffoldBackgroundColor: ColorPalette.mainBackground,
  );
}

class ColorPalette {
  static var mainColorFirst = const Color(0xFFD58E61);
  static var mainColorSecond = const Color(0xFFD06B50);
  static var mainBackground = const Color(0xFF3D4351);
  static var negativeColor = const Color(0xFF75829B);
  static var lightColor = const Color(0xFFB8ADAF);
}
