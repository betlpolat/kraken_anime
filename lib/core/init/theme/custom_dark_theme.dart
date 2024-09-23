import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_color_scheme.dart';
import 'custom_theme.dart';

/// Custom dark theme for project design
class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: useMaterial3,
        colorScheme: colorScheme,
        fontFamily: fontFamily,
        inputDecorationTheme: inputDecorationTheme,
        appBarTheme: appBarTheme,
      );

  @override
  bool get useMaterial3 => true;
  @override
  ColorScheme get colorScheme => CustomColorScheme.darkColorScheme;

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        fillColor: CustomColorScheme.darkColorScheme.onSurface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.darkColorScheme.onSurface,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.darkColorScheme.onSurface,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.darkColorScheme.onSurface,
            width: 2,
          ),
        ),
      );

  @override
  String get fontFamily => GoogleFonts.roboto().fontFamily!;

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(centerTitle: true);
}
