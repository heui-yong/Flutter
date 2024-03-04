import 'package:dio/dio.dart';
import 'package:json_serializable_app/network/model/rsp_human_info.dart';
import 'package:retrofit/retrofit.dart';

part 'api_retrofit_client.g.dart';

@RestApi()
abstract class ApiRestClient{
  factory ApiRestClient(Dio dio, {String baseUrl}) = _ApiRestClient;

  @GET("/human_info.json")
  Future<RspHumanInfo> getHumanInfo();
}