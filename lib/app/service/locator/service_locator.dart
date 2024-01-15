import 'package:get_it/get_it.dart';

import '../network_checker/network_checker_service.dart';

final GetIt locator = GetIt.instance;

// Service Locator
void setupServiceLocator() {
  locator.registerLazySingleton(() => NetworkCheckerService());
}
