class BaseNetworkError implements Exception {
  final String statusCode;
  final String message;

  BaseNetworkError(this.statusCode, this.message);
}
