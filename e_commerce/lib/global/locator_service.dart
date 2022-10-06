import 'package:e_commerce/core/services/implements/account_service.dart';
import 'package:e_commerce/core/services/interfaces/iaccount_service.dart';
import 'package:get_it/get_it.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IAccountService>(() => AccountService());
}
