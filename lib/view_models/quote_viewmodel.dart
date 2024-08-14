import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// 전체 Quote 데이터를 관리하는 ViewModel
class QuoteViewModel extends ChangeNotifier {
  // Shipping 및 ProductInfo 관련 상태 변수들
  int _selectedTabIndex = 0;
  String _originCountry = '';
  String _destinationCountry = '';
  String _originAddress = '';
  String _destinationAddress = '';
  DateTime _transportDate = DateTime.now();
  String _incoterms = '';
  String _exportImportType = '';
  String _itemName = '';
  String _hsCode = '';
  double _totalPrice = 0.0;
  double _volume = 0.0;
  String _volumeUnit = '';
  String _packagingInfo = '';
  int _totalItems = 0;
  DateTime _quoteDeadline = DateTime.now();
  List<XFile> _images = [];

  // Getter 및 Setter 함수들
  int get selectedTabIndex => _selectedTabIndex;
  String get originCountry => _originCountry;
  String get destinationCountry => _destinationCountry;
  String get originAddress => _originAddress;
  String get destinationAddress => _destinationAddress;
  DateTime get transportDate => _transportDate;
  String get incoterms => _incoterms;
  String get exportImportType => _exportImportType;
  String get itemName => _itemName;
  String get hsCode => _hsCode;
  double get totalPrice => _totalPrice;
  double get volume => _volume;
  String get volumeUnit => _volumeUnit;
  String get packagingInfo => _packagingInfo;
  int get totalItems => _totalItems;
  DateTime get quoteDeadline => _quoteDeadline;
  List<XFile> get images => _images;

  // 상태 업데이트 함수들
  void updateTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void updateOriginCountry(String country) {
    _originCountry = country;
    notifyListeners();
  }

  void updateDestinationCountry(String country) {
    _destinationCountry = country;
    notifyListeners();
  }

  void updateOriginAddress(String address) {
    _originAddress = address;
    notifyListeners();
  }

  void updateDestinationAddress(String address) {
    _destinationAddress = address;
    notifyListeners();
  }

  void updateTransportDate(DateTime date) {
    _transportDate = date;
    notifyListeners();
  }

  void updateIncoterms(String incoterm) {
    _incoterms = incoterm;
    notifyListeners();
  }

  void updateExportImportType(String type) {
    _exportImportType = type;
    notifyListeners();
  }

  void updateItemName(String name) {
    _itemName = name;
    notifyListeners();
  }

  void updateHSCode(String code) {
    _hsCode = code;
    notifyListeners();
  }

  void updateTotalPrice(double price) {
    _totalPrice = price;
    notifyListeners();
  }

  void updateVolume(double volume) {
    _volume = volume;
    notifyListeners();
  }

  void updateVolumeUnit(String unit) {
    _volumeUnit = unit;
    notifyListeners();
  }

  void updatePackagingInfo(String info) {
    _packagingInfo = info;
    notifyListeners();
  }

  void updateTotalItems(int items) {
    _totalItems = items;
    notifyListeners();
  }

  void updateQuoteDeadline(DateTime date) {
    _quoteDeadline = date;
    notifyListeners();
  }

  void addImage(XFile image) {
    if (_images.length < 4) {
      _images.add(image);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  // 데이터 저장 및 전송 관련 함수 추가 가능
}
