import 'dart:convert';

class GoalInfoModel {
  final Map<String, dynamic> _json;
  GoalInfoModel() : _json = jsonDecode(goalInfoJson);

  List<GoalInfo> getGoalInfo() {
    if (_json case {'goalInfo' : List goalInfoList}) {
      return <GoalInfo>[
        for (var goalInfo in goalInfoList) GoalInfo.fromJson(goalInfo)
      ];
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }
}

class GoalInfo{
  String title;
  String description;
  String imageUrl;
  GoalInfo({required this.title, required this.description, required this.imageUrl});

  factory GoalInfo.fromJson(Map<String, dynamic> json) {
    return GoalInfo(
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl']
    );
  }
}


const goalInfoJson = '''
{
  "goalInfo" : [
    {
      "title": "Improve Shape",
      "description": "I have a low amount of body fat and need / want to build more muscle",
      "imageUrl": "assets/icons/login_man1.svg"
    },
    {
      "title": "Lean & Tone",
      "description": "I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way",
      "imageUrl": "assets/icons/login_man2.svg"
    },
    {
      "title": "Lose a Fat",
      "description": "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass",
      "imageUrl": "assets/icons/login_man3.svg"
    }
  ]
}
''';