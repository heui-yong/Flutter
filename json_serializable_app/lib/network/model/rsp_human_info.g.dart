// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsp_human_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RspHumanInfo _$RspHumanInfoFromJson(Map<String, dynamic> json) => RspHumanInfo(
      humanInfo: (json['humanInfo'] as List<dynamic>)
          .map((e) => HumanInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RspHumanInfoToJson(RspHumanInfo instance) =>
    <String, dynamic>{
      'humanInfo': instance.humanInfo,
    };

HumanInfo _$HumanInfoFromJson(Map<String, dynamic> json) => HumanInfo(
      name: json['name'] as String,
      age: json['age'] as int,
      birthDate: json['birthDate'] as String,
    );

Map<String, dynamic> _$HumanInfoToJson(HumanInfo instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'birthDate': instance.birthDate,
    };
