import 'dart:convert';

class DietModel {
  final Map<String, dynamic> _json;
  DietModel() : _json = jsonDecode(dietJson);

  List<Diet> getDietInfo() {
    if (_json case {'diet' : List dietList}) {
      return <Diet>[
        for (var diet in dietList) Diet.fromJson(diet)
      ];
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }
}

class Diet{
  String name;
  String imageUrl;
  String boxColor;
  String level;
  String duration;
  String calorie;


  Diet({
    required this.name,
    required this.imageUrl,
    required this.boxColor,
    required this.level,
    required this.duration,
    required this.calorie,
  });

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      name: json['name'],
      imageUrl: json['imageUrl'],
      boxColor: json['boxColor'],
      level: json['level'],
      duration: json['duration'],
      calorie: json['calorie']
    );
  }
}


const dietJson = '''
{
  "diet" : [
    {
      "name": "Honey Pancake",
      "boxColor": "0xff9DCEFF",
      "imageUrl": "assets/icons/pancakes.svg",
      "level": "Easy",
      "duration": "30mins",
      "calorie": "180kCal"
    },
    {
      "name": "Orange",
      "boxColor": "0xffEEA4CE",
      "imageUrl": "assets/icons/orange-snacks.svg",
      "level": "Easy",
      "duration": "10mins",
      "calorie": "80kCal"
    },
    {
      "name": "Salmon Nigiri",
      "boxColor": "0xff9DCEFF",
      "imageUrl": "assets/icons/nigiri.svg",
      "level": "Medium",
      "duration": "20mins",
      "calorie": "120kCal"
    },
    {
      "name": "Blueberry Pancake",
      "boxColor": "0xffEEA4CE",
      "imageUrl": "assets/icons/pancake2.svg",
      "level": "Medium",
      "duration": "30mins",
      "calorie": "230kCal"
    }
  ]
}
''';