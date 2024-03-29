import 'package:flutter/cupertino.dart';
import '../services/api_service.dart';

class UserInfoDetailModel with ChangeNotifier{
  final Future<List<UerDetailInfo>> _uerInfoDetailList;

  List<UerDetailInfo>? _cachedUerInfoDetail;

  UserInfoDetailModel() : _uerInfoDetailList = ApiService().fetchUerDetailInfo();

  Future<List<UerDetailInfo>> get uerDetailInfoList async {
    _cachedUerInfoDetail ??= await _uerInfoDetailList;
    return _cachedUerInfoDetail!;
  }

  Future<UerDetailInfo> getUerDetailInfo(String name) async {
    return (await uerDetailInfoList).firstWhere((uerDetailInfo) => uerDetailInfo.name == name);
  }
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