// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserQuote _$UserQuoteFromJson(Map<String, dynamic> json) => UserQuote(
      id: (json['id'] as num?)?.toInt(),
      user: (json['user'] as num?)?.toInt() ?? 2,
      origin_country: json['origin_country'] as String? ?? '',
      destination_country: json['destination_country'] as String? ?? '',
      origin_address: json['origin_address'] as String? ?? '',
      destination_address: json['destination_address'] as String? ?? '',
      transport_date: json['transport_date'] as String? ?? '',
      incoterms: json['incoterms'] as String? ?? '',
      export_import_type: json['export_import_type'] as String? ?? '',
      item_name: json['item_name'] as String? ?? '',
      hs_code: json['hs_code'] as String? ?? '',
      total_price: (json['total_price'] as num?)?.toDouble() ?? 0.0,
      volume: (json['volume'] as num?)?.toDouble() ?? 0.0,
      volume_unit: json['volume_unit'] as String? ?? '',
      packaging_info: json['packaging_info'] as String? ?? '',
      total_items: (json['total_items'] as num?)?.toInt() ?? 0,
      quote_deadline: json['quote_deadline'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => QuoteImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserQuoteToJson(UserQuote instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'origin_country': instance.origin_country,
      'destination_country': instance.destination_country,
      'origin_address': instance.origin_address,
      'destination_address': instance.destination_address,
      'transport_date': instance.transport_date,
      'incoterms': instance.incoterms,
      'export_import_type': instance.export_import_type,
      'item_name': instance.item_name,
      'hs_code': instance.hs_code,
      'total_price': instance.total_price,
      'volume': instance.volume,
      'volume_unit': instance.volume_unit,
      'packaging_info': instance.packaging_info,
      'total_items': instance.total_items,
      'quote_deadline': instance.quote_deadline,
      'images': instance.images?.map((e) => e.toJson()).toList(),
    };
