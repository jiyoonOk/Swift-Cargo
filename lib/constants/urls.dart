class URLs {
  static const String baseUrl =
      'http://13.209.216.192:8000/api/v1/'; // API의 기본 URL

  // HSCode 관련 URL
  static const String hsCodeList = baseUrl + 'hscode/hscode/'; // 모든 HSCode를 가져옴
  static const String hsCodeDetail =
      baseUrl + 'hscode/hscode/{hs_code}/'; // 특정 HSCode를 가져옴
  static const String hsCodeSearch =
      baseUrl + 'hscode/search/{search_term}/'; // 특정 검색어로 HSCode를 검색

  // 사용자 견적 요청 관련 URL
  static const String userQuotes = baseUrl + 'userquotes/'; // 모든 사용자 견적을 가져옴
  static const String userQuoteDetails =
      baseUrl + 'userquotes/{id}/'; // 특정 ID의 사용자 견적 상세 정보를 가져옴
  static const String createUserQuote =
      baseUrl + 'userquotes/'; // 새로운 사용자 견적을 생성
  static const String updateUserQuote =
      baseUrl + 'userquotes/{id}/'; // 특정 ID의 사용자 견적을 업데이트
  static const String partialUpdateUserQuote =
      baseUrl + 'userquotes/{id}/'; // 특정 ID의 사용자 견적을 부분적으로 업데이트
  static const String deleteUserQuote =
      baseUrl + 'userquotes/{id}/'; // 특정 ID의 사용자 견적을 삭제

  // Companies 관련 URL
  static const String companiesList =
      baseUrl + 'companies/companies/'; // 모든 회사를 가져옴
  static const String createCompany =
      baseUrl + 'companies/companies/'; // 새로운 회사를 생성
  static const String companyDetails =
      baseUrl + 'companies/companies/{id}/'; // 특정 ID의 회사 상세 정보를 가져옴
  static const String updateCompany =
      baseUrl + 'companies/companies/{id}/'; // 특정 ID의 회사를 업데이트
  static const String partialUpdateCompany =
      baseUrl + 'companies/companies/{id}/'; // 특정 ID의 회사를 부분적으로 업데이트
  static const String deleteCompany =
      baseUrl + 'companies/companies/{id}/'; // 특정 ID의 회사를 삭제

  // Company Quotes 관련 URL
  static const String companyQuotesList =
      baseUrl + 'companies/companyquotes/'; // 모든 회사 견적을 가져옴
  static const String createCompanyQuote =
      baseUrl + 'companies/companyquotes/'; // 새로운 회사 견적을 생성
  static const String companyQuoteDetails =
      baseUrl + 'companies/companyquotes/{id}/'; // 특정 ID의 회사 견적 상세 정보를 가져옴
  static const String updateCompanyQuote =
      baseUrl + 'companies/companyquotes/{id}/'; // 특정 ID의 회사 견적을 업데이트
  static const String partialUpdateCompanyQuote =
      baseUrl + 'companies/companyquotes/{id}/'; // 특정 ID의 회사 견적을 부분적으로 업데이트
  static const String deleteCompanyQuote =
      baseUrl + 'companies/companyquotes/{id}/'; // 특정 ID의 회사 견적을 삭제

  // User Accounts 관련 URL
  static const String usersList =
      baseUrl + 'user_accounts/users/'; // 모든 사용자를 가져옴
  static const String createUser =
      baseUrl + 'user_accounts/users/'; // 새로운 사용자를 생성
  static const String userDetails =
      baseUrl + 'user_accounts/users/{id}/'; // 특정 ID의 사용자 상세 정보를 가져옴
  static const String updateUser =
      baseUrl + 'user_accounts/users/{id}/'; // 특정 ID의 사용자를 업데이트
  static const String partialUpdateUser =
      baseUrl + 'user_accounts/users/{id}/'; // 특정 ID의 사용자를 부분적으로 업데이트
  static const String deleteUser =
      baseUrl + 'user_accounts/users/{id}/'; // 특정 ID의 사용자를 삭제
}
