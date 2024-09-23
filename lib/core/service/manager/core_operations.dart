part of './base_dio.dart';

extension _CoreDioOperations on CoreDio {
  R? _responseParser<R, T>(BaseModel<T> model, Object? data) {
    if (data is List<Map<String, Object>>) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }
}
