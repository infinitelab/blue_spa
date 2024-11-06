import 'dart:convert';

import 'package:blue_spa/data/services/api_exception.dart';
import 'package:http/http.dart' as http;

dynamic apiResponseHandler(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      return jsonDecode(response.body);
    case 400:
      final responseBody = jsonDecode(response.body);
      throw ApiException(responseBody['message'] ?? "Bad request",
          apiExceptionType: ApiExceptionType.badRequest);
    case 401:
      final responseBody = jsonDecode(response.body);
      throw ApiException(responseBody['message'] ?? "Unauthorized",
          apiExceptionType: ApiExceptionType.unAuthorized);
    case 404:
      final responseBody = jsonDecode(response.body);
      throw ApiException(responseBody['message'] ?? "Not found",
          apiExceptionType: ApiExceptionType.notFound);
    case 500:
      final responseBody = jsonDecode(response.body);
      throw ApiException(responseBody['message'] ?? "Server error",
          apiExceptionType: ApiExceptionType.serverError);
    default:
      final responseBody = jsonDecode(response.body);
      throw ApiException(responseBody['message'] ?? "Unknow error",
          apiExceptionType: ApiExceptionType.unknown);
  }
}
