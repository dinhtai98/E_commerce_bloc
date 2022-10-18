import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:e_commerce/core/database/entities/products/product_entity.dart';
import 'package:isar/isar.dart';

part 'product_tag_entity.g.dart';

@collection
class ProductTag extends BaseEntity {
  late String name;
  @Backlink(to: 'productTag')
  var products = IsarLinks<Product>();
  ProductTag({
    String? uid,
    required this.name,
  }) : super(uid: uid);
}
