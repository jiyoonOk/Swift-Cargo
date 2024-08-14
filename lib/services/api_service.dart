import 'package:dio/dio.dart';
import 'package:fast_1/models/hscode_model.dart';
import 'package:fast_1/models/user_quote_model.dart';

class APIService {
  late Dio _dio;

  // API의 기본 URL 설정
  final String baseUrl = "http://13.209.216.192:8000/api/";

  APIService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: 3000),
      receiveTimeout: Duration(milliseconds: 3000),
    ));
  }

  // HSCode 정보를 가져오는 메서드
  Future<List<HSCode>> fetchHSCodes() async {
    try {
      Response response = await _dio.get('hscode/hscode/');
      if (response.statusCode == 200) {
        return (response.data as List).map((x) => HSCode.fromJson(x)).toList();
      } else {
        throw Exception(
            'Failed to retrieve HS Codes: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load HS Codes: ${e.toString()}');
    }
  }

  // 사용자 견적 정보를 가져오는 메서드
  Future<List<UserQuote>> fetchUserQuotes() async {
    try {
      Response response = await _dio.get('logistics/userquotes/');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((x) => UserQuote.fromJson(x))
            .toList();
      } else {
        throw Exception(
            'Failed to retrieve User Quotes: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load User Quotes: ${e.toString()}');
    }
  }

  // 견적 정보를 생성하는 메서드
  Future<UserQuote> createUserQuote(UserQuote quote) async {
    try {
      Response response = await _dio.post(
        'logistics/userquotes/',
        data: quote.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserQuote.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to create User Quote: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create User Quote: ${e.toString()}');
    }
  }
}
