import 'package:flutter/cupertino.dart';

class HumanInfoModel with ChangeNotifier {
  late HumanInfo _humanInfo;

  HumanInfoModel() {
    _humanInfo = HumanInfo(name: 'Heui Yong', age: 20, height: 173, weight: 67);
  }

  HumanInfo get humanInfo => _humanInfo;

  void setAge(int value) {
    _humanInfo.changeAge(value);
    notifyListeners();
  }

  void setHeight(int value) {
    _humanInfo.changeHeight(value);
    notifyListeners();
  }

  void setWeight(int value) {
    _humanInfo.changeWeight(value);
    notifyListeners();
  }
}

class HumanInfo {
  late String name;
  late int age;
  late int height;
  late int weight;

  HumanInfo({required this.name, required this.age, required this.height, required this.weight});

  void changeAge(int value) {
    age += value;
  }

  void changeHeight(int value) {
    height += value;
  }

  void changeWeight(int value) {
    weight += value;
  }
}