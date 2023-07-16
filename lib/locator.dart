import 'package:get_it/get_it.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
