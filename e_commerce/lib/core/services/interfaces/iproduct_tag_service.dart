import 'package:e_commerce/core/database/entities/product_tags/product_tag_entity.dart';

abstract class IProductTagService {
  List<ProductTag> getProductTags();
  ProductTag? findProductTagById(int id);
  Future<void> insertProductTag(ProductTag productTag);
  Future<void> insertProductTagList(List<ProductTag> productTags);
  Future<void> deleteProductTag(ProductTag productTag);
  Future<void> updateProductTag(ProductTag productTag);
}
