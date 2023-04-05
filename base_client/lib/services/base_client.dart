import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_client/services/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int timeOutDuration = 20;

  // GET
  Future<dynamic> get(String baseUrl, String api) async {
    final uri = Uri.parse(baseUrl + api);

    try {
      final response =
          await http.get(uri).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Api not responding', uri.toString());
    }
  }

  // Post
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    final uri = Uri.parse(baseUrl + api);
    final payload = json.encode(payloadObj.toString());

    try {
      final response = await http
          .post(uri, body: payload)
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Api not responding', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      //break;

      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());

      case 401:
      case 403:
        throw UnAuthorizeException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());

      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());

      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request?.url.toString());
    }
  }
}
