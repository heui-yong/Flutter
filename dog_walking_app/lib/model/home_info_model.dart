import 'package:dog_walking_app/services/api_service.dart';

class HomeInfoModel {
  final Future<List<HomeInfo>> homeInfoList;

  HomeInfoModel() : homeInfoList = ApiService().fetchHomeInfo();

  Future<List<UserInfo>> getNearList() async {
    try {
      List<HomeInfo> homeInfo = await homeInfoList;
      List<UserInfo> nearList = homeInfo.first.nearList;
      return nearList;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

}



class HomeInfo {
  List<UserInfo> nearList;
  List<UserInfo> suggestedList;

  HomeInfo({required this.nearList, required this.suggestedList});

  factory HomeInfo.fromJson(Map<String, dynamic> json) {
    var nearList = json['near'] as List;
    List<UserInfo> changeNearList =
      nearList.map<UserInfo>((e) => UserInfo.fromJson(e)).toList();

    var suggestedList = json['suggested'] as List;
    List<UserInfo> changeSuggestedList =
      suggestedList.map<UserInfo>((e) => UserInfo.fromJson(e)).toList();

    return HomeInfo(
      nearList: changeNearList,
      suggestedList: changeSuggestedList,
    );
  }
}

class UserInfo {
  String name;
  String distance;
  String cost;
  String imageUrl;

  UserInfo({required this.name, required this.distance, required this.cost, required this.imageUrl});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'],
      distance: json['distance'],
      cost: json['cost'],
      imageUrl: json['imageUrl'],
    );
  }
}
