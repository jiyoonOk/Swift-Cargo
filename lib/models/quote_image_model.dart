import 'package:json_annotation/json_annotation.dart';

part 'quote_image_model.g.dart';

@JsonSerializable()
class QuoteImage {
  final String path; // 이미지의 파일 경로를 저장

  QuoteImage({required this.path});

  factory QuoteImage.fromJson(Map<String, dynamic> json) =>
      _$QuoteImageFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteImageToJson(this);
}
