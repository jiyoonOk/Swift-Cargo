import 'package:flutter/material.dart';
import 'package:fast_1/services/api_service.dart';
import 'package:fast_1/models/user_quote_model.dart';

class UserQuoteViewModel with ChangeNotifier {
  List<UserQuote> userQuotes = [];
  final APIService _apiService = APIService();

  // 예시를 위해 사용자 입력을 관리하는 변수들 (실제로는 사용자 입력을 반영해야 함)
  int user = 1;
  String originCountry = "";
  String destinationCountry = "";
  String originAddress = "";
  String destinationAddress = "";
  String transportDate = "";
  String incoterms = "";
  String exportImportType = "";
  String itemName = "";
  String hsCode = "";
  String totalPrice = "";
  String volume = "";
  String volumeUnit = "";
  String packagingInfo = "";
  int totalItems = 0;
  DateTime quoteDeadline = DateTime.now();

  void fetchUserQuotes() async {
    userQuotes = await _apiService.fetchUserQuotes();
    notifyListeners();
  }

  void addUserQuote(UserQuote quote) async {
    UserQuote newQuote = await _apiService.createUserQuote(quote);
    userQuotes.add(newQuote);
    notifyListeners();
  }

  Future<void> submitUserQuote() async {
    UserQuote quote = UserQuote(
      user: user,
      origin_country: originCountry,
      destination_country: destinationCountry,
      origin_address: originAddress,
      destination_address: destinationAddress,
      transport_date: transportDate,
      incoterms: incoterms,
      export_import_type: exportImportType,
      item_name: itemName,
      hs_code: hsCode,
      total_price: totalPrice,
      volume: volume,
      volume_unit: volumeUnit,
      packaging_info: packagingInfo,
      total_items: totalItems,
      quote_deadline: quoteDeadline.toIso8601String(),
    );
    addUserQuote(quote);
  }

  // 여기에 추가적인 입력을 관리하는 메소드나 로직 추가
}
