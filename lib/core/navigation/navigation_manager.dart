import 'package:flutter/material.dart';
import 'navigation_routes.dart';

class NavigationManager {
  NavigationManager._();
  static NavigationManager instance = NavigationManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();
  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage<T>({
    required NavigationRoutes route,
    Object? arguments,
  }) async {
    await _navigatorGlobalKey.currentState?.pushNamed(route.withSlash, arguments: arguments);
  }
}
