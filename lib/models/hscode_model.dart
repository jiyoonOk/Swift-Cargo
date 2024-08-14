import 'package:json_annotation/json_annotation.dart';

part 'hscode_model.g.dart'; //

@JsonSerializable()
class HSCode {
  final String hs_code;
  final String classification_name;
  final String english_name;
  final String korean_name;

  HSCode(
      {required this.hs_code,
      required this.classification_name,
      required this.english_name,
      required this.korean_name});

  factory HSCode.fromJson(Map<String, dynamic> json) => _$HSCodeFromJson(json);
  Map<String, dynamic> toJson() => _$HSCodeToJson(this);
}
