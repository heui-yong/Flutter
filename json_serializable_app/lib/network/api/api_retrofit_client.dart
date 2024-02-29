import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_retrofit_client.g.dart';

@RestApi()
abstract class ApiRestClient{
  factory ApiRestClient(Dio dio, {String baseUrl}) = _ApiRestClient;

  @GET("/human_info.json")
  Future<String> getHumanInfo();
}