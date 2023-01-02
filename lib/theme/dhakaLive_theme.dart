import 'package:dhakalive/utils/palette.dart';
import 'package:flutter/material.dart';

import 'color_schemes.dart';

class DhakaLiveTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: darkColorScheme,
      // colorSchemeSeed: Color(0xffFF5722),
      useMaterial3: true,
      fontFamily: 'Rubik',
      appBarTheme: const AppBarTheme(elevation: 0),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      fontFamily: 'Satoshi',
      appBarTheme: const AppBarTheme(elevation: 0),
    );
  }
}
