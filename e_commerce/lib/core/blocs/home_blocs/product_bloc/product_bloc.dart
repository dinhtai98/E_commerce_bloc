import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/database/entities/product_tags/product_tag_entity.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_service.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_tag_service.dart';
import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  final _productService = locator<IProductService>();
  final _productTagService = locator<IProductTagService>();

  List<ProductUIModel> products = [];
  List<ProductUIModel> listOfProductRecommended = [];
  List<ProductTag> tags = [];
  ProductBloc() : super(const ProductBlocState.initial()) {
    on<ProductInitEvent>(
      (event, emit) {
        List<Color> colors = [
          ColorUtils.lightOrange2,
          ColorUtils.lightPink,
          ColorUtils.lightPurple,
        ];
        var productsInDb = _productService.getProducts();
        Random random = Random();
        for (var item in productsInDb) {
          int cindex = random.nextInt(colors.length);
          Color tempcol = colors[cindex];
          products.add(ProductUIModel(product: item, backgroundColor: tempcol));
        }
        tags = _productTagService.getProductTags();
        listOfProductRecommended = _productService
            .getProducts()
            .take(2)
            .map((x) => ProductUIModel(product: x, elevation: 5))
            .toList();
        emit(
          ProductBlocState.productLoadSuccess(
            listOfProduct: products,
            listOfProductRecommended: listOfProductRecommended,
            listOfProductTag: tags,
          ),
        );
      },
    );

    on<ProductTagSelectedEvent>((event, emit) {
      var listOfProduct = event.tagSelected.products
          .map((e) => ProductUIModel(product: e, elevation: 5))
          .toList();
      emit(state.copyWith(
          tagSelected: event.tagSelected, listOfProduct: listOfProduct));
    });
  }
}
