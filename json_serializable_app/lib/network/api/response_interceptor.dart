import 'dart:convert';

import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      final jsonString = response.data as String;

      try {
        final decodedData = jsonDecode(jsonString) as Map<String, dynamic>;
        response.data = decodedData;
      } on FormatException catch (e) {
        print("Error parsing JSON: $e");
      }
    }

    super.onResponse(response, handler);
  }
}