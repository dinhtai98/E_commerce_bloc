import 'package:e_commerce/core/database/daos/base_dao.dart';
import 'package:e_commerce/core/database/entities/products/product_entity.dart';

class ProductDao extends BaseDao<Product> {
  @override
  Future<void> insertAll(List<Product> entities) async {
    try {
      await collection.isar.writeTxn(() async {
        await collection.putAll(entities);
        for (var item in entities) {
          await item.productTag.save();
        }
      });
      // ignore: empty_catches
    } catch (e) {}
  }
}
