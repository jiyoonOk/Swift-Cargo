import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/dependency_injection.dart';
import 'constants/app_theme.dart';
import 'package:fast_1/view_models/hscode_viewmodel.dart';
import 'package:fast_1/view_models/user_quote_viewmodel.dart';
import 'package:fast_1/views/user_quote_page/user_quote_page.dart';

void main() {
  setupLocator(); // 의존성 주입 설정을 초기화
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swift-Cargo App',
      theme: AppTheme.themeData,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => locator<HSCodeViewModel>()),
          ChangeNotifierProvider(create: (_) => locator<UserQuoteViewModel>()),
          ChangeNotifierProvider(
              create: (_) => locator<UserQuoteViewModel>()), // 추가된 부분
        ],
        child: ShippingPage(),
      ),
    );
  }
}
