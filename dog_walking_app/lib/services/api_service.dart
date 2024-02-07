import 'dart:convert';

import '../model/home_info_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://raw.githubusercontent.com/heui-yong/Flutter/main/Json/dog_walking_app_json/home.json";

  Future<List<HomeInfo>> fetchHomeInfo() async {
    List<HomeInfo> homeInfoInstances = [];
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("response.statusCode == 200 ${response.body}");
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
}