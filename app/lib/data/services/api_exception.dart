enum ApiExceptionType {
  badRequest,
  unAuthorized,
  notFound,
  serverError,
  noInterNet,
  unknown
}

class ApiException implements Exception {
  final String message;
  final ApiExceptionType? apiExceptionType;
  ApiException(this.message, {this.apiExceptionType});
}
