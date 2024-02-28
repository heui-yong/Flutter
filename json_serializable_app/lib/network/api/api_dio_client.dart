import 'package:dio/dio.dart';

Dio apiDioClient() {
  final dio = Dio()..options = BaseOptions(baseUrl: 'https://raw.githubusercontent.com/');

  return dio;
}