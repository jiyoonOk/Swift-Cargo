import 'package:flutter/material.dart';
import 'package:fast_1/services/api_service.dart';
import 'package:fast_1/models/hscode_model.dart';

class HSCodeViewModel with ChangeNotifier {
  List<HSCode> hsCodes = [];
  final APIService _apiService = APIService();

  // HSCode 정보를 로드하는 함수
  void fetchHSCodes() async {
    hsCodes = await _apiService.fetchHSCodes();
    notifyListeners();
  }
}
