import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BasketUIModel extends Equatable {
  final int basketId;
  final ProductUIModel product;
  final String combo;
  int quantity;

  BasketUIModel({
    required this.basketId,
    required this.product,
    required this.quantity,
    this.combo = '',
  });

  @override
  List<Object?> get props => [product, quantity, combo, basketId];
}
