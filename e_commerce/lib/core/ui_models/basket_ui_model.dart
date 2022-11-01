import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:equatable/equatable.dart';

class BasketUIModel extends Equatable {
  final ProductUIModel product;
  final String combo;
  final int quantity;

  const BasketUIModel({
    required this.product,
    required this.quantity,
    this.combo = '',
  });

  @override
  List<Object?> get props => [product, quantity, combo];
}
