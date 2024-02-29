import 'package:json_annotation/json_annotation.dart';

part 'rsp_human_info.g.dart';

@JsonSerializable()
class RspHumanInfo {
  final List<HumanInfo> humanInfo;

  RspHumanInfo({required this.humanInfo});

  factory RspHumanInfo.fromJson(Map<String, dynamic> json) => _$RspHumanInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RspHumanInfoToJson(this);
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