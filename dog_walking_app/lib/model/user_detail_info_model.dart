import '../services/api_service.dart';

class UserInfoDetailModel{
  final Future<List<UerDetailInfo>> _uerInfoDetail;

  List<UerDetailInfo>? _cachedUerInfoDetail;

  UserInfoDetailModel() : _uerInfoDetail = ApiService().fetchUerDetailInfo();
}

class UerDetailInfo{
  String name;
  String distance;
  String cost;
  String imageUrl;
  String scope;
  String walks;
  Map<String, dynamic> about;
  String location;
  List<Reviews> reviews;

  UerDetailInfo({
    required this.name,
    required this.distance,
    required this.cost,
    required this.imageUrl,
    required this.scope,
    required this.walks,
    required this.about,
    required this.location,
    required this.reviews
  });

  factory UerDetailInfo.fromJson(Map<String, dynamic> json) {
    var reviewList = json['reviews'] as List;
    List<Reviews> changeReviewList =
        reviewList.map<Reviews>((e) => Reviews.fromJson(e)).toList();

    return UerDetailInfo(
      name: json['name'],
      distance: json['distance'],
      cost: json['cost'],
      imageUrl: json['imageUrl'],
      scope: json['scope'],
      walks: json['walks'],
      about: json['about'],
      location: json['location'],
      reviews: changeReviewList
    );
  }
}

// class About {
//   String age;
//   String experience;
//   String description;
//
//   About({
//     required this.age,
//     required this.experience,
//     required this.description
//   });
//
//   factory About.fromJson(Map<String, dynamic> json) {
//     return About(
//       age: json['age'],
//       experience: json['experience'],
//       description: json['description'],
//     );
//   }
// }

class Reviews {
  String reviewer;
  String date;
  String reviewDesc;
  String scope;

  Reviews({
    required this.reviewer,
    required this.date,
    required this.reviewDesc,
    required this.scope
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      reviewer: json['reviewer'],
      date: json['date'],
      reviewDesc: json['reviewDesc'],
      scope: json['scope'],
    );
  }
}