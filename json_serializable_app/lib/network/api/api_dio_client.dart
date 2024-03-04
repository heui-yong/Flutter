import 'package:dio/dio.dart';
import 'package:json_serializable_app/network/api/response_interceptor.dart';

Dio apiDioClient() {
  final dio = Dio()..options = BaseOptions(baseUrl: "https://raw.githubusercontent.com/heui-yong/Flutter/main/Json/json_serialiazble_app_json/");

  dio.interceptors.add(ResponseInterceptor());

  return dio;
}