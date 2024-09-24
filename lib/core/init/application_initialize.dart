import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import '../../firebase_options.dart';
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
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    ApplicationStateContainer.setup();
  }
}
