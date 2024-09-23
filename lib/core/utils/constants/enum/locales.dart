import 'package:flutter/material.dart';

///Project locale enums for operation and configuration
enum Locales {
  en(Locale('en', 'US'));

  final Locale locale;
  const Locales(this.locale);
}
