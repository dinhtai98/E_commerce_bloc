import 'package:e_commerce/core/database/daos/product_dao.dart';
import 'package:e_commerce/core/database/entities/products/product_entity.dart';
import 'package:e_commerce/core/database/isar_database.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_service.dart';
import 'package:e_commerce/global/locator.dart';

class ProductService implements IProductService {
  final _productDao = locator<ProductDao>();
  @override
  Future<void> deleteProduct(Product product) async {
    await _productDao.deleteById(product.id);
  }

  @override
  Product? findProductById(int id) {
    return _productDao.findById(id);
  }

  @override
  List<Product> getProducts() {
    return _productDao.getAllCollection();
  }

  @override
  Future<void> insertProduct(Product product) async {
    await _productDao.insert(product);
  }

  @override
  Future<void> insertProductList(List<Product> products) async {
    await _productDao.insertAll(products);
  }

  @override
  Future<void> updateProduct(Product product) async {
    await _productDao.updateById(product.id, product);
  }
}
