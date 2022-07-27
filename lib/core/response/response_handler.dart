import 'dart:convert';
import 'dart:io';

import 'package:flutter_task/core/network/base_api_service.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class ResponseHandler extends BaseApiService {
  @override
  Future getResponse(String url, bool isHeaderRequired, [token]) async {
    dynamic apiResponse;
    try {
      final response = isHeaderRequired
          ? await http.get(Uri.parse(url), headers: {HttpHeaders.authorizationHeader: 'Bearer $token'})
          : await http.get(Uri.parse(url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return apiResponse;
  }

  @override
  Future postResponse(String url, Map<String, String> jsonBody) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: jsonBody);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
