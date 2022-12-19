import 'package:e_commerce/core/database/daos/account_dao.dart';
import 'package:e_commerce/core/database/daos/basket_item_dao.dart';
import 'package:e_commerce/core/database/daos/product_dao.dart';
import 'package:e_commerce/core/database/daos/product_tag_dao.dart';
import 'package:get_it/get_it.dart';

void registerDaoSingletons(GetIt locator) {
  locator.registerLazySingleton(() => AccountDao());
  locator.registerLazySingleton(() => ProductTagDao());
  locator.registerLazySingleton(() => ProductDao());
  locator.registerLazySingleton(() => BasketItemDao());
}
