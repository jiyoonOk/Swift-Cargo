// UserQuote 모델 정의 파일
class UserQuote {
  final int id;
  final String originCountry;
  final String destinationCountry;
  final String originAddress;
  final String destinationAddress;
  final DateTime transportDate;
  final String incoterms;
  final String exportImportType;
  final String itemName;
  final String hsCode;
  final double totalPrice;
  final double volume;
  final String volumeUnit;
  final String packagingInfo;
  final int totalItems;
  final DateTime quoteDeadline;
  final List<String> images; // 이미지 경로 목록

  UserQuote({
    required this.id,
    required this.originCountry,
    required this.destinationCountry,
    required this.originAddress,
    required this.destinationAddress,
    required this.transportDate,
    required this.incoterms,
    required this.exportImportType,
    required this.itemName,
    required this.hsCode,
    required this.totalPrice,
    required this.volume,
    required this.volumeUnit,
    required this.packagingInfo,
    required this.totalItems,
    required this.quoteDeadline,
    required this.images,
  });
}
