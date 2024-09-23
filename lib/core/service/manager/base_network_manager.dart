import 'package:dio/dio.dart';

import 'I_core_dio.dart';
import 'base_dio.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://api.jikan.moe/v4/',
    );

    coreDio = CoreDio(baseOptions);
  }
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;
}
