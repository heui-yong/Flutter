import 'dart:convert';
import '../model/home_info_model.dart';
import 'package:http/http.dart' as http;

import '../model/user_detail_info_model.dart';

class ApiService {
  final String baseUrl = "https://raw.githubusercontent.com/heui-yong/Flutter/main/Json/dog_walking_app_json/";

  Future<List<HomeInfo>> fetchHomeInfo() async {
    List<HomeInfo> homeInfoInstances = [];
    final url = Uri.parse("${baseUrl}home.json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if(json case {'homeInfo' : List homeInfoList}) {
        for (var homeInfo in homeInfoList) {
          homeInfoInstances.add(HomeInfo.fromJson(homeInfo));
        }
        return homeInfoInstances;
      }
    }
    throw Exception('Failed to load data');
  }

  Future<List<UerDetailInfo>> fetchUerDetailInfo() async {
    List<UerDetailInfo> uerDetailInfoInstances = [];
    final url = Uri.parse("${baseUrl}user_detail_info.json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print("${response.body}");
      if(json case {'userDetailInfo' : List userDetailInfoList}) {
        for (var userDetailInfo in userDetailInfoList) {
          uerDetailInfoInstances.add(UerDetailInfo.fromJson(userDetailInfo));
        }
        return uerDetailInfoInstances;
      }
    }
    throw Exception('Failed to load data');
  }
}