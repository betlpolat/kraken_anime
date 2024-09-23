import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/enum/locales.dart';

@immutable

/// Project localization manager
class LocalizationManager extends EasyLocalization {
  LocalizationManager({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _path,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [Locales.en.locale];
  static final String _path = 'assets/translations';
}
