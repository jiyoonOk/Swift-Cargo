import 'package:json_annotation/json_annotation.dart';

part 'user_quote_model.g.dart';

@JsonSerializable()
class UserQuote {
  final int user;
  final String origin_country;
  final String destination_country;
  final String origin_address;
  final String destination_address;
  final String transport_date;
  final String incoterms;
  final String export_import_type;
  final String item_name;
  final String hs_code;
  final String total_price;
  final String volume;
  final String volume_unit;
  final String packaging_info;
  final int total_items;
  final String quote_deadline;

  UserQuote({
    required this.user,
    required this.origin_country,
    required this.destination_country,
    required this.origin_address,
    required this.destination_address,
    required this.transport_date,
    required this.incoterms,
    required this.export_import_type,
    required this.item_name,
    required this.hs_code,
    required this.total_price,
    required this.volume,
    required this.volume_unit,
    required this.packaging_info,
    required this.total_items,
    required this.quote_deadline,
  });

  factory UserQuote.fromJson(Map<String, dynamic> json) =>
      _$UserQuoteFromJson(json);
  Map<String, dynamic> toJson() => _$UserQuoteToJson(this);
}
