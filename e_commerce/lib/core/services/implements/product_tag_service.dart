import 'package:e_commerce/core/database/daos/product_tag_dao.dart';
import 'package:e_commerce/core/database/entities/product_tags/product_tag_entity.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_tag_service.dart';
import 'package:e_commerce/global/locator.dart';

class ProductTagService implements IProductTagService {
  final _productTagDao = locator<ProductTagDao>();
  @override
  Future<void> deleteProductTag(ProductTag productTag) async {
    await _productTagDao.deleteById(productTag.id);
  }

  @override
  ProductTag? findProductTagById(int id) {
    return _productTagDao.findById(id);
  }

  @override
  List<ProductTag> getProductTags() {
    return _productTagDao.getAllCollection();
  }

  @override
  Future<void> insertProductTag(ProductTag productTag) async {
    await _productTagDao.insert(productTag);
  }

  @override
  Future<void> insertProductTagList(List<ProductTag> productTags) async {
    await _productTagDao.insertAll(productTags);
  }

  @override
  Future<void> updateProductTag(ProductTag productTag) async {
    await _productTagDao.updateById(productTag.id, productTag);
  }
}
