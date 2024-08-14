// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hscode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HSCode _$HSCodeFromJson(Map<String, dynamic> json) => HSCode(
      hs_code: json['hs_code'] as String,
      classification_name: json['classification_name'] as String,
      english_name: json['english_name'] as String,
      korean_name: json['korean_name'] as String,
    );

Map<String, dynamic> _$HSCodeToJson(HSCode instance) => <String, dynamic>{
      'hs_code': instance.hs_code,
      'classification_name': instance.classification_name,
      'english_name': instance.english_name,
      'korean_name': instance.korean_name,
    };
