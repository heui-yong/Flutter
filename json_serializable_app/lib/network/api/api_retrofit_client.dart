import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/rsp_human_info.dart';

part 'api_retrofit_client.g.dart';

@RestApi()
abstract class ApiRestClient{
  factory ApiRestClient(Dio dio, {String baseUrl}) = _ApiRestClient;

  @GET('/heui-yong/Flutter/main/Json/json_serialiazble_app_json/human_info.json')
  Future<ReqRspHumanInfo> getHumanInfo();
}