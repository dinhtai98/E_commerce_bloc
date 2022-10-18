import 'package:e_commerce/core/database/entities/products/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductUIModel extends Equatable {
  final Product product;
  final Color backgroundColor;
  final double elevation;

  const ProductUIModel({
    required this.product,
    this.backgroundColor = Colors.white,
    this.elevation = 1,
  });

  @override
  List<Object?> get props => [product, backgroundColor, elevation];
}
