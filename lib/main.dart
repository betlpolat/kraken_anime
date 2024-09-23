import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/init/application_initialize.dart';
import 'core/init/language/localization_manager.dart';
import 'core/init/theme/custom_dark_theme.dart';
import 'core/init/theme/custom_light_theme.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/navigation_routes.dart';

Future<void> main() async {
  await ApplicationInitialize().start();
  runApp(LocalizationManager(child: const _MyApp()));
}

class _MyApp extends StatelessWidget with NavigationRoutesMixin<dynamic> {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigationManager.instance.navigatorGlobalKey,
    );
  }
}
