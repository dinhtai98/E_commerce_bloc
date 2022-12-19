import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:e_commerce/core/database/entities/products/product_entity.dart';
import 'package:isar/isar.dart';

part 'product_tag_entity.g.dart';

@Collection(inheritance: false)
// ignore: must_be_immutable
class ProductTag extends BaseEntity {
  @override
  Id id;
  late String name;
  @Backlink(to: 'productTag')
  var products = IsarLinks<Product>();
  ProductTag({
    String? uid,
    required this.name,
  }) : id = Isar.autoIncrement,
        super(uid: uid);

  @ignore
  @override
  List<Object?> get props => [name];
}
