import 'package:get_it/get_it.dart';
import 'package:fast_1/services/api_service.dart';
import 'package:fast_1/view_models/hscode_viewmodel.dart';
import 'package:fast_1/view_models/user_quote_viewmodel.dart';
import 'package:fast_1/view_models/quote_viewmodel.dart';


final GetIt locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => APIService());

  // ViewModels
  locator.registerFactory(() => HSCodeViewModel());
  locator.registerFactory(() => UserQuoteViewModel());
  locator.registerFactory(() => QuoteViewModel());
  
}
