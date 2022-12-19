import 'package:e_commerce/core/database/daos/basket_item_dao.dart';
import 'package:e_commerce/core/database/entities/basket_items/basket_item_entity.dart';
import 'package:e_commerce/core/services/interfaces/ibasket_service.dart';
import 'package:e_commerce/global/locator.dart';

class BasketService extends IBasketService {
  final _basketDao = locator<BasketItemDao>();
  @override
  Future<void> addBasketItem(BasketItem basketItem) async {
    await _basketDao.insert(basketItem);
  }

  @override
  Future<void> removeBasketItem(int basketId) async {
    await _basketDao.deleteById(basketId);
  }

  @override
  Stream<List<BasketItem>> streamBaskets() {
    return _basketDao.streamBaskets();
  }

  @override
  List<BasketItem> getBasketItems() {
    return _basketDao.getAllCollection();
  }

  @override
  Future<void> clearBasket() async {
    await _basketDao.clearCollection();
  }

  @override
  Future<void> updateBasket(BasketItem basketItem) async {
    await _basketDao.updateById(basketItem.id, basketItem);
  }

  @override
  BasketItem? findBasketById(int basketId)  {
    return _basketDao.findById(basketId);
  }
}
