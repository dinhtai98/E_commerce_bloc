import 'package:e_commerce/core/database/entities/account_entity.dart';
import 'package:e_commerce/core/database/entities/basket_items/basket_item_entity.dart';
import 'package:e_commerce/core/database/entities/card/card_entity.dart';
import 'package:e_commerce/core/database/entities/delivery/delivery_entity.dart';
import 'package:e_commerce/core/database/entities/product_tags/product_tag_entity.dart';
import 'package:e_commerce/core/database/entities/products/product_entity.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_service.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_tag_service.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:isar/isar.dart';

class IsarDatabase {
  IsarDatabase();
  Isar? isar;

  static List<CollectionSchema<dynamic>> schemas = [
    AccountSchema,
    ProductSchema,
    ProductTagSchema,
    BasketItemSchema,
    DeliverySchema,
    CardEntitySchema,
  ];
  Future<void> init() async {
    isar ??= await Isar.open(schemas, name: "db");
    await createProductDumpData();
  }

  Future<void> createProductDumpData() async {
    var _productService = locator<IProductService>();
    var _productTagService = locator<IProductTagService>();
    var products = _productService.getProducts();
    if (products.isNotEmpty) return;
    var productHottestTag = ProductTag(name: "Hottest");
    var productPopularTag = ProductTag(name: "Popular");
    var productNewComboTag = ProductTag(name: "New Combo");
    await _productTagService.insertProductTagList(
        [productHottestTag, productPopularTag, productNewComboTag]);
    var productListToInsert = [
      Product(
        name: 'Honey lime combo',
        price: 2000,
        image: 'assets/images/Honey-Lime-Peach-Fruit-Salad.png',
      )..productTag.value = productHottestTag,
      Product(
        name: 'Berry mango combo',
        price: 2000,
        image: 'assets/images/Glowing-Berry-Fruit-Salad.png',
      )..productTag.value = productHottestTag,
      Product(
        name: 'Quinoa fruit salad',
        price: 10000,
        image: 'assets/images/breakfast-quinoa-and-red-fruit-salad.png',
      )..productTag.value = productPopularTag,
      Product(
        name: 'Tropical fruit salad',
        price: 10000,
        image: 'assets/images/Best-Ever-Tropical-Fruit-Salad.png',
      )..productTag.value = productPopularTag,
      Product(
        name: 'Melon fruit salad',
        price: 10000,
        image: 'assets/images/Honey-Lime-Peach-Fruit-Salad.png',
      )..productTag.value = productNewComboTag,
    ];
    await _productService.insertProductList(productListToInsert);
  }
}
