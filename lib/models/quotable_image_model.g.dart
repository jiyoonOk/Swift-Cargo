// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotable_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotableImage _$QuotableImageFromJson(Map<String, dynamic> json) =>
    QuotableImage(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$QuotableImageToJson(QuotableImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
