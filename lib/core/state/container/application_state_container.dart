import 'package:get_it/get_it.dart';

/// Application container for dependency injection
class ApplicationStateContainer {
  const ApplicationStateContainer._();
  static final _getIt = GetIt.I;

  /// Application core required items
  static void setup() {
    //  _getIt.registerSingleton<BaseNetworkManager>(BaseNetworkManager());
  }

  /// read your dependency item for [ApplicationStateContainer]
  static T read<T extends Object>() => _getIt<T>();
}
