// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:e_commerce/core/ui_models/basket_ui_model.dart';
import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:e_commerce/core/utils/list_extension.dart';
import 'package:isar/isar.dart';

part 'basket_item_entity.g.dart';

@Collection(inheritance: false)
class BasketItem extends BaseEntity {
  @override
  Id id;
  late int productId;
  late String? productUid;
  late String name;
  late double price;
  late String image;
  late int quantity;
  late String comboName;
  BasketItem({
    String? uid,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    this.productUid,
    this.comboName = '',
  })  : id = Isar.autoIncrement,
        super(uid: uid);

  BasketUIModel toUIModel(List<ProductUIModel> products) {
    var _productUIModel =
        products.firstOrDefault((x) => x.product.id == productId);
    return BasketUIModel(
      basketId: id,
      product: _productUIModel!,
      quantity: quantity,
      combo: comboName,
    );
  }

  @override
  @ignore
  List<Object?> get props => [
        productId,
        name,
        price,
        image,
        quantity,
        productUid,
      ];
}
