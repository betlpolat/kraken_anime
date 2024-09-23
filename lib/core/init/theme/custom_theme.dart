import 'package:flutter/material.dart';

/// Custom theme for project design
abstract class CustomTheme {
  bool get useMaterial3;
  ThemeData get themeData;
  ColorScheme get colorScheme;
  String get fontFamily;
  InputDecorationTheme get inputDecorationTheme;
  AppBarTheme get appBarTheme;
}
