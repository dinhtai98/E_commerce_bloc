import 'package:e_commerce/core/database/entities/products/product_entity.dart';

abstract class IProductService {
  List<Product> getProducts();
  Product? findProductById(int id);
  Future<void> insertProduct(Product product);
  Future<void> insertProductList(List<Product> products);
  Future<void> deleteProduct(Product product);
  Future<void> updateProduct(Product product);
}
