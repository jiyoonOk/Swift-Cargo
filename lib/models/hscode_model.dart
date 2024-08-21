// HSCode 데이터를 위한 모델 정의
// json_serializable 라이브러리를 사용하여 JSON과 Dart 객체간의 변환을 자동으로 처리. json_serializable 라이브러리는 코드 생성을 위해 build_runner 패키지와 함께 사용해야 함.

import 'package:json_annotation/json_annotation.dart';

part 'hscode_model.g.dart';

@JsonSerializable() // JSON 인코딩/디코딩을 위한 코드 생성 어노테이션
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

  factory HSCode.fromJson(Map<String, dynamic> json) => _$HSCodeFromJson(
      json); // JSON을 객체로 변환하는 팩토리 생성자로 json의 구조에 따라 유연하게 객체를 생성
  Map<String, dynamic> toJson() => _$HSCodeToJson(this); // 객체를 JSON으로 변환하는 메서드
}
