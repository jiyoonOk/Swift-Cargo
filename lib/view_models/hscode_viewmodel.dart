import 'package:flutter/material.dart';
import 'package:fast_1/services/api_service.dart';
import 'package:fast_1/models/hscode_model.dart';

class HSCodeViewModel with ChangeNotifier {                     // ChangeNotifier 클래스를 상속하여 뷰모델 클래스 생성. ChangeNotifier 클래스는 Provider 패키지에서 제공하는 클래스로, 데이터의 변경을 감지하고, 변경이 발생하면 리스너에게 알려줌.
  List<HSCode> hsCodes = [];
  final APIService _apiService = APIService();                  

  // HSCode 정보를 로드하는 함수
  void fetchHSCodes() async {                                  // HSCode 정보를 가져오는 비동기 함수
    hsCodes = await _apiService.fetchHSCodes();                // API 서비스를 사용하여 HSCode 정보를 가져옴
    notifyListeners();                                         // 데이터 변경을 알리는 notifyListeners() 함수 호출.
  }
}
