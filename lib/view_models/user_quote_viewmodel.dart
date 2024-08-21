import 'package:flutter/material.dart';
import 'package:fast_1/services/api_service.dart';
import 'package:fast_1/models/user_quote_model.dart';
import 'package:fast_1/models/quote_image_model.dart';

// ChangeNotifier 클래스를 상속받아서 ViewModel 클래스를 생성. ChangeNotifier는 Provider 패키지에서 제공하는 클래스로, 데이터 변경을 감지하고 화면을 업데이트하는 기능을 제공
class UserQuoteViewModel extends ChangeNotifier {
  final APIService _apiService;
  List<UserQuote> quotes = []; // 사용자 견적 정보 목록
  UserQuote currentQuote = UserQuote.init(); // 초기 상태의 UserQuote 객체

  // 생성자: API 서비스를 주입받고 초기 데이터를 가져옴
  UserQuoteViewModel(this._apiService);

  // 모든 견적 정보를 가져오는 메서드
  void fetchQuotes() async {
    quotes = await _apiService.fetchUserQuotes();
    notifyListeners(); // 데이터 변경을 감지하고 화면을 업데이트
  }

  // 현재 선택된 견적 정보를 업데이트하는 메서드
  void updateCurrentQuote(UserQuote updatedQuote) {
    currentQuote = updatedQuote;
    notifyListeners();
  }

  void updateItemName(String itemName) {
    currentQuote = currentQuote.copyWith(item_name: itemName);
    notifyListeners();
  }

  void updateHSCode(String hsCode) {
    currentQuote = currentQuote.copyWith(hs_code: hsCode);
    notifyListeners();
  }

  void updateTotalPrice(double totalPrice) {
    currentQuote = currentQuote.copyWith(total_price: totalPrice.toString());
    notifyListeners();
  }

  void updateVolume(double volume) {
    currentQuote = currentQuote.copyWith(volume: volume.toString());
    notifyListeners();
  }

  void updateVolumeUnit(String volumeUnit) {
    currentQuote = currentQuote.copyWith(volume_unit: volumeUnit);
    notifyListeners();
  }

  void updatePackagingInfo(String packagingInfo) {
    currentQuote = currentQuote.copyWith(packaging_info: packagingInfo);
    notifyListeners();
  }

  void updateTotalItems(int totalItems) {
    currentQuote = currentQuote.copyWith(total_items: totalItems);
    notifyListeners();
  }

  void updateQuoteDeadline(DateTime deadline) {
    currentQuote =
        currentQuote.copyWith(quote_deadline: deadline.toIso8601String());
    notifyListeners();
  }

  void addImage(QuoteImage image) {
    if (currentQuote.images == null) {
      currentQuote = currentQuote.copyWith(images: []);
    }
    currentQuote.images!.add(image); // 여기서 !는 null이 아님을 보장
    notifyListeners();
  }

  void removeImage(int index) {
    if (currentQuote.images != null && currentQuote.images!.isNotEmpty) {
      currentQuote.images!.removeAt(index); // 여기서 !는 null이 아님을 보장
      notifyListeners();
    }
  }

  // 견적 정보 추가 또는 업데이트 메서드
  Future<void> addOrUpdateQuote() async {
    if (currentQuote.id == null) {
      UserQuote newQuote = await _apiService.createUserQuote(currentQuote);
      quotes.add(newQuote);
    } else {
      await _apiService.updateUserQuote(currentQuote);
      int index = quotes.indexWhere((q) => q.id == currentQuote.id);
      if (index != -1) {
        quotes[index] = currentQuote;
      }
    }
    notifyListeners();
  }

  // 견적 정보 삭제 메서드
  Future<void> deleteQuote(int quoteId) async {
    await _apiService.deleteUserQuote(quoteId);
    quotes.removeWhere((quote) => quote.id == quoteId);
    notifyListeners();
  }
}
