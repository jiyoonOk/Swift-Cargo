import 'package:json_annotation/json_annotation.dart';
import 'quote_image_model.dart';

part 'user_quote_model.g.dart';

@JsonSerializable(
    explicitToJson:
        true) // explicitToJson: true로 설정하여 toJson() 메서드가 Map<String, dynamic>을 반환하도록 함
class UserQuote {
  final int? id;
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
  final double total_price;
  final double volume;
  final String volume_unit;
  final String packaging_info;
  final int total_items;
  final String quote_deadline;
  final List<QuoteImage>? images;

  UserQuote({
    this.id,
    this.user = 3, // 임시로 0로 설정
    this.origin_country = '',
    this.destination_country = '',
    this.origin_address = '',
    this.destination_address = '',
    this.transport_date = '',
    this.incoterms = '',
    this.export_import_type = '',
    this.item_name = '',
    this.hs_code = '',
    this.total_price = 0.0,
    this.volume = 0.0,
    this.volume_unit = '',
    this.packaging_info = '',
    this.total_items = 0,
    this.quote_deadline = '',
    List<QuoteImage>? images,
  }) : images = images ?? [];

  UserQuote.init() : this();

  // copyWith 메소드 구현. 인스턴스의 일부 속성만 변경하고, 나머지 속성은 그대로 유지한 새로운 인스턴스를 생성.
  UserQuote copyWith({
    int? id,
    int? user,
    String? origin_country,
    String? destination_country,
    String? origin_address,
    String? destination_address,
    String? transport_date,
    String? incoterms,
    String? export_import_type,
    String? item_name,
    String? hs_code,
    String? total_price,
    String? volume,
    String? volume_unit,
    String? packaging_info,
    int? total_items,
    String? quote_deadline,
    List<QuoteImage>? images,
  }) {
    return UserQuote(
      id: id ?? this.id,
      user: user ?? this.user,
      origin_country: origin_country ?? this.origin_country,
      destination_country: destination_country ?? this.destination_country,
      origin_address: origin_address ?? this.origin_address,
      destination_address: destination_address ?? this.destination_address,
      transport_date: transport_date ?? this.transport_date,
      incoterms: incoterms ?? this.incoterms,
      export_import_type: export_import_type ?? this.export_import_type,
      item_name: item_name ?? this.item_name,
      hs_code: hs_code ?? this.hs_code,
      total_price:
          total_price != null ? double.parse(total_price) : this.total_price,
      volume: volume != null ? double.parse(volume) : this.volume,
      volume_unit: volume_unit ?? this.volume_unit,
      packaging_info: packaging_info ?? this.packaging_info,
      total_items: total_items ?? this.total_items,
      quote_deadline: quote_deadline ?? this.quote_deadline,
      images: images != null
          ? List<QuoteImage>.from(images)
          : List<QuoteImage>.from(this.images ?? []),
    );
  }

  // 커스텀 toJson 메소드
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user'] = user;
    data['origin_country'] = origin_country;
    data['destination_country'] = destination_country;
    data['origin_address'] = origin_address;
    data['destination_address'] = destination_address;
    data['transport_date'] = transport_date;
    data['incoterms'] = incoterms;
    data['export_import_type'] = export_import_type;
    data['item_name'] = item_name;
    data['hs_code'] = hs_code;
    data['total_price'] = total_price.toStringAsFixed(2);
    data['volume'] = volume.toStringAsFixed(2); //
    data['volume_unit'] = volume_unit;
    data['packaging_info'] = packaging_info;
    data['total_items'] = total_items;
    data['quote_deadline'] = quote_deadline;
    // images 필드는 서버로 전송하지 않음
    return data;
  }

  factory UserQuote.fromJson(Map<String, dynamic> json) =>
      _$UserQuoteFromJson(json);
  //Map<String, dynamic> toJson() => _$UserQuoteToJson(this);
}
