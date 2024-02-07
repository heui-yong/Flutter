import 'package:dog_walking_app/services/api_service.dart';

class HomeInfoModel {
  final Future<List<HomeInfo>> _homeInfoList;

  List<HomeInfo>? _cachedHomeInfo;

  HomeInfoModel() : _homeInfoList = ApiService().fetchHomeInfo();

  Future<List<HomeInfo>> get homeInfoList async {
    _cachedHomeInfo ??= await _homeInfoList;
    return _cachedHomeInfo!;
  }

  Future<List<UserInfo>> getNearList() async {
    return (await homeInfoList).first.nearList;
  }

  Future<List<UserInfo>> getSuggestedList() async {
    return (await homeInfoList).first.suggestedList;
  }

  Future<List<UserInfo>> getTopList() async {
    return (await homeInfoList).first.topList;
  }
}

class HomeInfo {
  List<UserInfo> nearList;
  List<UserInfo> suggestedList;
  List<UserInfo> topList;

  HomeInfo({required this.nearList, required this.suggestedList, required this.topList});

  factory HomeInfo.fromJson(Map<String, dynamic> json) {
    var nearList = json['near'] as List;
    List<UserInfo> changeNearList =
      nearList.map<UserInfo>((e) => UserInfo.fromJson(e)).toList();

    var suggestedList = json['suggested'] as List;
    List<UserInfo> changeSuggestedList =
      suggestedList.map<UserInfo>((e) => UserInfo.fromJson(e)).toList();

    var topList = json['top'] as List;
    List<UserInfo> changeTopList =
      topList.map<UserInfo>((e) => UserInfo.fromJson(e)).toList();

    return HomeInfo(
      nearList: changeNearList,
      suggestedList: changeSuggestedList,
      topList: changeTopList
    );
  }
}

class UserInfo {
  String name;
  String distance;
  String cost;
  String imageUrl;
  String scope;

  UserInfo({required this.name, required this.distance, required this.cost, required this.imageUrl, required this.scope});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'],
      distance: json['distance'],
      cost: json['cost'],
      imageUrl: json['imageUrl'],
      scope: json['scope'],
    );
  }
}
