import 'package:flutter/cupertino.dart';
import 'package:json_serializable_app/network/model/rsp_human_info.dart';

import '../network/api/api_dio_client.dart';
import '../network/api/api_retrofit_client.dart';

class HumanInfoProvider  with ChangeNotifier {
  late ApiRestClient apiClient;
  late List<HumanInfo> humanInfoList;

  HumanInfoProvider() : super() {
    apiClient = ApiRestClient(apiDioClient());
    getHumanInfo();
  }

  void getHumanInfo() async {
    humanInfoList = (await apiClient.getHumanInfo()).humanInfo;
    print(humanInfoList);
    notifyListeners();
  }
}