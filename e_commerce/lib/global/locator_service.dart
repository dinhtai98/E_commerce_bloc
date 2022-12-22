import 'package:e_commerce/core/services/implements/account_service.dart';
import 'package:e_commerce/core/services/implements/basket_service.dart';
import 'package:e_commerce/core/services/implements/card_service.dart';
import 'package:e_commerce/core/services/implements/delivery_service.dart';
import 'package:e_commerce/core/services/implements/product_service.dart';
import 'package:e_commerce/core/services/implements/product_tag_service.dart';
import 'package:e_commerce/core/services/interfaces/iaccount_service.dart';
import 'package:e_commerce/core/services/interfaces/ibasket_service.dart';
import 'package:e_commerce/core/services/interfaces/icard_service.dart';
import 'package:e_commerce/core/services/interfaces/idelivery_serivce.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_service.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_tag_service.dart';
import 'package:get_it/get_it.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IAccountService>(() => AccountService());
  locator.registerLazySingleton<IProductService>(() => ProductService());
  locator.registerLazySingleton<IProductTagService>(() => ProductTagService());
  locator.registerLazySingleton<IBasketService>(() => BasketService());
  locator.registerLazySingleton<IDeliveryService>(() => DeliveryService());
  locator.registerLazySingleton<ICardService>(() => CardService());
}
