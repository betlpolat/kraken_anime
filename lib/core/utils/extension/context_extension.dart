import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Returns the [MediaQueryData] associated with the current [BuildContext].
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

///Extension methods for
extension MediaQueryExtension on BuildContext {
  /// Returns the [double] associated with the current [BuildContext].
  double get height => mediaQuery.size.height;

  /// Returns the [double] associated with the current [BuildContext].
  double get width => mediaQuery.size.width;

  /// Returns the [double] associated with the current [BuildContext].
  double dynamicHeight(double val) => height * val;

  /// Returns the [double] associated with the current [BuildContext].
  double dynamicWidth(double val) => width * val;

  /// Returns the [double] associated with the current [BuildContext].
  double get lowValue => height * 0.01;

  /// Returns the [double] associated with the current [BuildContext].

  double get normalValue => height * 0.02;

  /// Returns the [double] associated with the current [BuildContext].
  double get mediumValue => height * 0.04;

  /// Returns the [double] associated with the current [BuildContext].

  double get highValue => height * 0.1;

  /// Returns the [double] associated with the current [BuildContext].
  double get lowValueWidth => width * 0.001;

  /// Returns the [double] associated with the current [BuildContext].
  double get normalValueWidth => width * 0.02;

  /// Returns the [double] associated with the current [BuildContext].
  double get mediumValueWidth => width * 0.04;

  /// Returns the [double] associated with the current [BuildContext].
  double get highValueWidth => width * 0.1;
}

///Theme extension
extension ThemeExtension on BuildContext {
  /// Returns the [ThemeData] associated with the current [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] defined in the current [ThemeData].
  TextTheme get textTheme => theme.textTheme;

  /// Returns the [ColorScheme] defined in the current [ThemeData].
  ColorScheme get colors => theme.colorScheme;
}

///Localization extension
extension LocalizationExtension on BuildContext {
  /// Returns the [Locale] associated with the current Locale.
  Locale? get currentLocale => EasyLocalization.of(this)!.currentLocale;
}

/// Contains extension methods on the [BuildContext] class to simplify the creation of
/// [EdgeInsets] objects for padding in Flutter.
extension PaddingExtensionAll on BuildContext {
  /// Returns a value representing a low dimension, calculated as 0.01 times the current widget's height.
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);

  /// Returns a value representing a normal dimension, calculated as 0.02 times the current widget's height.
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);

  /// Returns a value representing a medium dimension, calculated as 0.04 times the current widget's height.
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);

  /// Returns a value representing a high dimension, calculated as 0.1 times the current widget's height.
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  /// Returns a value representing a low dimension, calculated as 0.01 times the current widget's width.
  EdgeInsets get paddingLowWidth => EdgeInsets.all(lowValueWidth);

  /// Returns a value representing a normal dimension, calculated as 0.02 times the current widget's width.
  EdgeInsets get paddingNormalWidth => EdgeInsets.all(normalValueWidth);

  /// Returns a value representing a medium dimension, calculated as 0.04 times the current widget's width.
  EdgeInsets get paddingMediumWidth => EdgeInsets.all(mediumValueWidth);

  /// Returns a value representing a high dimension, calculated as 0.1 times the current widget's width.
  EdgeInsets get paddingHighWidth => EdgeInsets.all(highValueWidth);
}

///Extension EdgeInsets.only for padding
extension PaddingExtensionOnly on BuildContext {
  /// Returns a value representing a normal dimension, calculated as 0.02 times the current widget's width.
  EdgeInsets get paddingNormalTopLeft => EdgeInsets.only(top: normalValue, left: normalValue);
}

// [EdgeInsets] objects for padding symmetric in Flutter.
// ignore: public_member_api_docs
extension PaddingExtensionSymmetric on BuildContext {
  /// Returns an [EdgeInsets] object with vertical  only, where the vertical  value
  /// is set to [lowValue].
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);

  /// Returns an [EdgeInsets] object with vertical  only, where the vertical  value
  /// is set to [normalValue].
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);

  /// Returns an [EdgeInsets] object with vertical  only, where the vertical  value
  /// is set to [mediumValue].
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);

  /// Returns an [EdgeInsets] object with vertical  only, where the vertical  value
  /// is set to [highValue].
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  /// Returns an [EdgeInsets] object with vertical  only, where the horizontal  value
  /// is set to [lowValue].
  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);

  /// Returns an [EdgeInsets] object with vertical  only, where the horizontal  value
  /// is set to [normalValue].
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);

  /// Returns an [EdgeInsets] object with vertical  only, where the horizontal  value
  /// is set to [mediumValue].
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);

  /// Returns an [EdgeInsets] object with vertical  only, where the horizontal  value
  /// is set to [highValue].
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}

/// Provides convenient access to commonly used [Duration] values.
extension DurationExtension on BuildContext {
  /// Returns a [Duration] object with a low duration of 500 milliseconds.
  Duration get durationLow => const Duration(milliseconds: 500);

  /// Returns a [Duration] object with a normal duration of 1 second.

  Duration get durationNormal => const Duration(seconds: 1);

  /// Returns a [Duration] object with a high duration of 2 seconds.

  Duration get durationHigh => const Duration(seconds: 2);
}

/// Extension methods for [BuildContext] to create [BorderRadius] objects.

extension BorderRadiusExtension on BuildContext {
  /// Returns a [Radius] object with a circular radius equal to [width] multiplied by 0.02.
  BorderRadius get lowBorderRadius => BorderRadius.all(Radius.circular(width * 0.02));

  /// Returns a [Radius] object with a circular radius equal to [width] multiplied by 0.05.
  BorderRadius get normalBorderRadius => BorderRadius.all(Radius.circular(width * 0.05));

  /// Returns a [Radius] object with a circular radius equal to [width] multiplied by 0.1.
  BorderRadius get highBorderRadius => BorderRadius.all(Radius.circular(width * 0.1));
}
