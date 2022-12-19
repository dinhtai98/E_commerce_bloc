import 'package:e_commerce/core/database/entities/basket_items/basket_item_entity.dart';

abstract class IBasketService {
  Future<void> addBasketItem(BasketItem basketItem);
  Future<void> removeBasketItem(int basketId);
  Stream<List<BasketItem>> streamBaskets();
  List<BasketItem> getBasketItems();
  Future<void> clearBasket();
  Future<void> updateBasket(BasketItem basketItem);
  BasketItem? findBasketById(int basketId);
}
