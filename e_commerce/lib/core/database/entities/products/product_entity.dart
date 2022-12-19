import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:e_commerce/core/database/entities/product_tags/product_tag_entity.dart';
import 'package:isar/isar.dart';
part 'product_entity.g.dart';

@Collection(inheritance: false)
// ignore: must_be_immutable
class Product extends BaseEntity {
  @override
  Id id;
  late String name;
  late double price;
  late String image;
  late bool favorite;
  var productTag = IsarLink<ProductTag>();
  Product({
    String? uid,
    required this.name,
    required this.price,
    this.favorite = false,
    required this.image,
  }) : id = Isar.autoIncrement,
        super(uid: uid);

  @ignore
  @override
  List<Object?> get props => [
        name,
        price,
        image,
        favorite,
      ];
}
