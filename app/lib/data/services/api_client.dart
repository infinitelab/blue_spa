import 'dart:convert';

import 'package:blue_spa/data/models/response_model.dart';
import 'package:blue_spa/data/services/api_exception.dart';
import 'package:blue_spa/data/services/api_response_handler.dart';
import 'package:blue_spa/utils/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl;
  final Map<String, String> _headers;

  ApiClient(
      {String baseUrl = AppConstants.baseUrl, Map<String, String>? headers})
      : _baseUrl = baseUrl,
        _headers = headers ?? {'Content-Type': 'application/json'};

  _testApiCall(String url, {Object? body}) {
    if (kDebugMode) {
      print('Api Call ===> $url ,  headers : $_headers , body : $body');
    }
  }

  _testApiResponse(
    String url,
    http.Response res,
  ) {
    if (kDebugMode) {
      print(
          'Api Response ===> $url , status code: ${res.statusCode},  res : ${res.body}');
    }
  }

  updateHeader(Map<String, String> headers) {
    _headers.addAll(headers);
  }

  Future<dynamic> signUp(Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/signup');
    _testApiCall(url.toString(), body: data);

    try {
      final response =
          await http.post(url, headers: _headers, body: jsonEncode(data));
      _testApiResponse(url.toString(), response);
      return apiResponseHandler(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signIn(Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/signin');
    _testApiCall(url.toString(), body: data);

    try {
      final response =
          await http.post(url, headers: _headers, body: jsonEncode(data));
      _testApiResponse(url.toString(), response);
      return apiResponseHandler(response);
    } catch (e) {
      rethrow;
    }
  }
}
