import 'package:json_annotation/json_annotation.dart';

part 'rsp_human_info.g.dart';

@JsonSerializable()
class ReqRspHumanInfo {
  List<HumanInfo> humanInfo;

  ReqRspHumanInfo({required this.humanInfo});

  factory ReqRspHumanInfo.fromJson(Map<String, dynamic> json) => _$ReqRspHumanInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ReqRspHumanInfoToJson(this);
}


@JsonSerializable()
class HumanInfo {
  final String name;
  final int age;
  final String birthDate;

  HumanInfo({
    required this.name,
    required this.age,
    required this.birthDate
  });

  factory HumanInfo.fromJson(Map<String, dynamic> json) => _$HumanInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HumanInfoToJson(this);
}

// class HumanInfo {
//   final String name;
//   final int age;
//   final String birthDate;
//
//   HumanInfo({
//     required this.name,
//     required this.age,
//     required this.birthDate
//   });
//
//   factory HumanInfo.fromJson(Map<String, dynamic> json) {
//     return HumanInfo(
//       name: json['name'],
//       age: json['age'],
//       birthDate: json['birthDate']
//     );
//   }
// }