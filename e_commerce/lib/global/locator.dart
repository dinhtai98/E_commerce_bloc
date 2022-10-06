import 'package:e_commerce/core/database/isar_database.dart';
import 'package:e_commerce/global/global_data.dart';
import 'package:e_commerce/global/locator_dao.dart';
import 'package:e_commerce/global/locator_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => IsarDatabase());
  locator.registerLazySingleton(() => GlobalData());
  await locator<IsarDatabase>().init();
  registerDaoSingletons(locator);
  registerServiceSingletons(locator);
}
