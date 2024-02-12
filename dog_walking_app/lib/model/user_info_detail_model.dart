class UserInfoDetailModel{

}

class UerInfoDetail{
  String name;
  String distance;
  String cost;
  String imageUrl;
  String scope;
  String walks;
  About about;
  String location;

}

class About {
  String age;
  String experience;
  String description;

  About({
    required this.age,
    required this.experience,
    required this.description
  });

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      age: json['age'],
      experience: json['experience'],
      description: json['description'],
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
}