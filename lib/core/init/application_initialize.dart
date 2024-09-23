import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../state/container/application_state_container.dart';

@immutable

/// This class is used to initialize the application process.
class ApplicationInitialize {
  /// Project required basic initialize
  Future<void> start() async {
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {});
  }

  /// This method is used to initialize the application process.
  static Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    ApplicationStateContainer.setup();
  }
}
