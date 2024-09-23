import 'package:flutter/material.dart';
import 'custom_color_scheme.dart';
import 'custom_theme.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: useMaterial3,
        colorScheme: colorScheme,
        inputDecorationTheme: inputDecorationTheme,
        fontFamily: fontFamily,
        appBarTheme: appBarTheme,
      );

  @override
  bool get useMaterial3 => true;
  @override
  ColorScheme get colorScheme => CustomColorScheme.lightColorScheme;

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        fillColor: CustomColorScheme.lightColorScheme.onSurface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.lightColorScheme.onSurface,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.lightColorScheme.onSurface,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.lightColorScheme.onSurface,
            width: 2,
          ),
        ),
      );
  @override
  String get fontFamily => GoogleFonts.roboto().fontFamily!;
  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        centerTitle: true,
      );
}
