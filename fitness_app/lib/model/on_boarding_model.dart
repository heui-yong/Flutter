import 'dart:convert';

class OnBoardingModel {
  final Map<String, dynamic> _json;
  OnBoardingModel() : _json = jsonDecode(onBoardingJson);

  List<OnBoarding> getOnBoarding() {
    if (_json case {'onBoarding' : List onBoardingList}) {
      return <OnBoarding>[
        for (var onBoarding in onBoardingList) OnBoarding.fromJson(onBoarding)
      ];
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }
}

class OnBoarding{
  String title;
  String subTitle;
  String imageUrl;
  OnBoarding({required this.title, required this.subTitle, required this.imageUrl});

  factory OnBoarding.fromJson(Map<String, dynamic> json) {
    return OnBoarding(
        title: json['title'],
        subTitle: json['subTitle'],
        imageUrl: json['imageUrl']
    );
  }
}


const onBoardingJson = '''
{
  "onBoarding" : [
    {
      "title": "Track Your Goal",
      "subTitle": "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "imageUrl": "assets/icons/on_boarding1.svg"
    },
    {
      "title": "Get Burn",
      "subTitle": "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "imageUrl": "assets/icons/on_boarding2.svg"
    },
    {
      "title": "Eat Well",
      "subTitle": "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "imageUrl": "assets/icons/on_boarding3.svg"
    },
    {
      "title": "Improve Sleep Quality",
      "subTitle": "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      "imageUrl": "assets/icons/on_boarding4.svg"
    }
  ]
}
''';