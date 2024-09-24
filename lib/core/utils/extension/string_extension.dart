import 'package:easy_localization/easy_localization.dart';

///Extension on [String] for locale string with easy_localization package
extension StringExtension on String {
  /// Returns [String] for locale Strings.
  String get locale => this.tr();
}
