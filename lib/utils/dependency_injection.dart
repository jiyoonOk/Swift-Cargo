import 'package:get_it/get_it.dart';
import 'package:fast_1/services/api_service.dart';
import 'package:fast_1/view_models/hscode_viewmodel.dart';
import 'package:fast_1/view_models/user_quote_viewmodel.dart';

final GetIt locator = GetIt
    .instance; // locator 패턴을 사용하여 의존성 주입을 관리. locator 패턴이란 애플리케이션 전체에서 사용되는 객체를 중앙에서 관리하는 패턴.

void setupLocator() {
  // 의존성 주입 설정을 초기화하는 함수
  // Services
  locator.registerLazySingleton(() =>
      APIService()); // registerLazySingleton()을 사용하여 APIService 클래스의 인스턴스를 lazy singleton으로 등록하여, 인스턴스가 필요할 때 생성되고 앱 전체 생명주기 동안 재사용.

  // ViewModels
  locator.registerFactory(() =>
      HSCodeViewModel()); // registerFactory()를 사용하여 HSCodeViewModel 클래스의 인스턴스를 생성하는 팩토리 함수를 등록. 뷰모델은 화면의 상태를 관리하고, 화면이 소멸되면 함께 소멸되어야 하기 때문에 팩토리 함수를 사용하여 매번 새로운 인스턴스를 생성.
  locator.registerFactory(() => UserQuoteViewModel(locator<
      APIService>())); // locator<APIService>()를 사용하여 APIService 인스턴스를 주입받아 UserQuoteViewModel 인스턴스를 생성
}
