import 'package:json_annotation/json_annotation.dart';

part 'quotable_image_model.g.dart';

@JsonSerializable()
class QuotableImage {
  final int id;
  final String image;

  QuotableImage({required this.id, required this.image});

  factory QuotableImage.fromJson(Map<String, dynamic> json) =>
      _$QuotableImageFromJson(json);
  Map<String, dynamic> toJson() => _$QuotableImageToJson(this);
}
