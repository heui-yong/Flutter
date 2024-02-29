import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_serializable_app/network/model/rsp_human_info.dart';

import '../network/api/api_dio_client.dart';
import '../network/api/api_retrofit_client.dart';

class HumanInfoProvider  with ChangeNotifier {
  late ApiRestClient apiClient;
  late List<HumanInfo> humanInfoList = [];

  HumanInfoProvider() : super() {
    apiClient = ApiRestClient(apiDioClient());
  }

  Future<void> fetchHumanInfo() async {
    try {
      final response = await apiClient.getHumanInfo();
      var decodeData = jsonDecode(response);
      final value = RspHumanInfo.fromJson(decodeData);
      humanInfoList = value.humanInfo;
      notifyListeners();
    } catch (e) {
      // 에러 처리
      print(e);
    }
  }
}