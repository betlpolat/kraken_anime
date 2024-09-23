import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../utils/constants/enum/http_types.dart';
import '../../utils/constants/model/base_error.dart';
import '../../utils/constants/model/base_model.dart';
import '../../utils/extension/http_type_extension.dart';
import 'I_core_dio.dart';
import 'response_model.dart';

part './core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {
  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = IOHttpClientAdapter();
  }
  @override
  final BaseOptions options;

  @override
  Future<IResponseModel<R>> send<R, T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request<Object>(
      path,
      data: data,
      options: Options(
        method: type.rawValue,
      ),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }
}
