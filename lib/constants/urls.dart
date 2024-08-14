class URLs {
  static const String baseUrl = '13.209.216.192:8000/api'; // API의 기본 URL

  // HSCode 관련 URL
  static const String hsCodeList = baseUrl + 'hscode/hscode/';
  static const String hsCodeDetail = baseUrl + 'hscode/search/{search_term}/';

  // 사용자 견적 요청 관련 URL
  static const String userQuotes = baseUrl + 'logistics/userquotes/';
  static const String userQuoteDetails = baseUrl + 'logistics/userquotes/{id}/';
  static const String createUserQuote = baseUrl + 'logistics/userquotes/';

  // 기타 필요한 URL 추가
}
