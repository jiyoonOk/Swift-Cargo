import 'package:dio/dio.dart';
import 'package:fast_1/models/hscode_model.dart';
import 'package:fast_1/models/user_quote_model.dart';
import 'package:fast_1/constants/urls.dart';
import 'package:path/path.dart' as p;
import 'dart:convert';

class APIService {
  late Dio
      _dio; // Dio 인스턴스 생성. API 호출을 위한 Dio 객체. dio는 HTTP 클라이언트 라이브러리로 REST API 호출을 위한 기능을 제공. get 요청, post 요청 등을 보낼 수 있음.

  // API의 기본 URL 설정
  final String baseUrl = URLs.baseUrl;

  // Dio 인스턴스 생성. 기능: API 호출
  APIService() {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('admin@rapidlogis.com:admin1234'));
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(milliseconds: 3000),
        receiveTimeout: Duration(milliseconds: 3000),
        headers: {'Authorization': basicAuth}));
  }

  // 응답 처리 메서드
  Future<dynamic> _handleApiResponse(Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data as dynamic;
    } else {
      throw Exception(
          'Failed to process request: Status ${response.statusCode}');
    }
  }

  // HSCode 정보를 가져오는 메서드. Future: 비동기 처리를 위한 Future 객체 반환
  Future<List<HSCode>> fetchHSCodes() async {
    try {
      Response response =
          await _dio.get(URLs.hsCodeSearch); // Dio를 사용하여 GET 요청을 보냄
      var data = await _handleApiResponse(response); // 응답 처리 메서드 호출
      return (data as List).map((x) => HSCode.fromJson(x)).toList();
    } catch (e) {
      throw Exception('Failed to load HS Codes: ${e.toString()}');
    }
  }

  // 사용자 견적 정보를 가져오는 메서드
  Future<List<UserQuote>> fetchUserQuotes() async {
    try {
      Response response = await _dio.get(URLs.userQuotes);
      var data = await _handleApiResponse(response);
      return (data as List).map((x) => UserQuote.fromJson(x)).toList();
    } catch (e) {
      throw Exception('Failed to load User Quotes: ${e.toString()}');
    }
  }

  // 견적 정보를 생성하는 메서드
  Future<UserQuote> createUserQuote(UserQuote quote) async {
    try {
      var formData = FormData();

      // 전체 견적 객체를 JSON 문자열로 변환하고 'data' 키 아래에 단일 문자열로 저장
      String quoteJson = jsonEncode(quote.toJson());
      formData.fields.add(MapEntry('data', quoteJson));

      // 이미지가 있을 경우 추가
      if (quote.images != null && quote.images!.isNotEmpty) {
        for (var image in quote.images!) {
          var file = await MultipartFile.fromFile(image.path,
              filename: p.basename(image.path));
          formData.files.add(MapEntry('images', file));
        }
      } else {
        // 이미지가 없을 경우 빈 배열 추가
        formData.fields.add(MapEntry('images', '[]'));
      }

      // 서버로 보내는 데이터 로깅
      print('Sending data to server: ${formData.fields} ${formData.files}');
      // 서버로 보내는 URL 로깅
      print("Posting to URL: ${URLs.userQuotes}");

      // POST 요청 실행
      Response response = await _dio.post(URLs.userQuotes, data: formData);
      var data = await _handleApiResponse(response);
      return UserQuote.fromJson(data);
    } catch (e) {
      throw Exception('Failed to create User Quote: $e');
    }
  }

  // 견적 정보를 업데이트하는 메서드
  Future<UserQuote> updateUserQuote(UserQuote quote) async {
    try {
      Response response =
          await _dio.put(URLs.updateUserQuote, data: quote.toJson());
      var data = await _handleApiResponse(response);
      return UserQuote.fromJson(data);
    } catch (e) {
      throw Exception('Failed to update User Quote: ${e.toString()}');
    }
  }

  // 견적 정보를 삭제하는 메서드
  Future<void> deleteUserQuote(int quoteId) async {
    try {
      Response response = await _dio.delete(URLs.deleteUserQuote);
      await _handleApiResponse(response);
    } catch (e) {
      throw Exception('Failed to delete User Quote: ${e.toString()}');
    }
  }
}
