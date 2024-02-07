import 'package:dog_walking_app/services/api_service.dart';

class HomeInfoModel {

}



class HomeInfo {
  List<Near> near;
  List<Suggested> suggested;

  HomeInfo({required this.near, required this.suggested});

  factory HomeInfo.fromJson(Map<String, dynamic> json) {
    var nearList = json['near'] as List;
    List<Near> changeNearList =
      nearList.map<Near>((e) => Near.fromJson(e)).toList();

    var suggestedList = json['suggested'] as List;
    List<Suggested> changeSuggestedList =
      suggestedList.map<Suggested>((e) => Suggested.fromJson(e)).toList();

    return HomeInfo(
      near: changeNearList,
      suggested: changeSuggestedList,
    );
  }
}

class Near {
  String name;
  String distance;
  String cost;
  String imageUrl;

  Near({required this.name, required this.distance, required this.cost, required this.imageUrl});

  factory Near.fromJson(Map<String, dynamic> json) {
    return Near(
      name: json['name'],
      distance: json['distance'],
      cost: json['cost'],
      imageUrl: json['imageUrl'],
    );
  }
}

class Suggested {
  String name;
  String distance;
  String cost;
  String imageUrl;

  Suggested({required this.name, required this.distance, required this.cost, required this.imageUrl});

  factory Suggested.fromJson(Map<String, dynamic> json) {
    return Suggested(
        name: json['name'],
        distance: json['distance'],
        cost: json['cost'],
        imageUrl: json['imageUrl'],
    );
  }
}
