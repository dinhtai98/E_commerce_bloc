import 'package:e_commerce/core/database/daos/account_dao.dart';
import 'package:get_it/get_it.dart';

void registerDaoSingletons(GetIt locator) {
  locator.registerLazySingleton(() => AccountDao());
}
