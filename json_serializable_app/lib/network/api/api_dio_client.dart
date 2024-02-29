import 'package:dio/dio.dart';

Dio apiDioClient() {
  final dio = Dio()..options = BaseOptions(baseUrl: "https://raw.githubusercontent.com/heui-yong/Flutter/main/Json/json_serialiazble_app_json/");

  return dio;
}