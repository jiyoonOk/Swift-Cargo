import 'package:flutter/material.dart';

// 앱 전반에 사용되는 테마를 정의하는 파일
class AppTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: Color(0xFF344D8E),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF344D8E)),
    toggleButtonsTheme: ToggleButtonsThemeData(
      color: Color(0xFF344D8E),
      selectedColor: Colors.white,
      fillColor: Color(0xFF344D8E),
      borderColor: Color(0xFF344D8E),
      selectedBorderColor: Color(0xFF344D8E),
    ),
    textTheme: TextTheme(),
  );
}
