import 'package:e_commerce/core/database/daos/base_dao.dart';
import '../entities/basket_items/basket_item_entity.dart';

class BasketItemDao extends BaseDao<BasketItem> {
  Stream<List<BasketItem>> streamBaskets() {
    var query = collection.isar.basketItems.buildQuery<BasketItem>();
    return query.watch();
  }
}
