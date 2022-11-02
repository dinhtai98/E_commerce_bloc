import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/database/entities/product_tags/product_tag_entity.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_service.dart';
import 'package:e_commerce/core/services/interfaces/iproduct_tag_service.dart';
import 'package:e_commerce/core/ui_models/basket_ui_model.dart';
import 'package:e_commerce/core/ui_models/product_ui_model.dart';
import 'package:e_commerce/core/utils/color_utils.dart';
import 'package:e_commerce/global/global_data.dart';
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
  ProductBloc() : super(ProductBlocInitial()) {
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
        locator<GlobalData>().basketList = products
            .map((e) => BasketUIModel(product: e, quantity: 1))
            .toList();
        emit(
          ProductLoadedState(
            listOfProduct: products,
            listOfProductRecommended: listOfProductRecommended,
            listOfProductTag: tags,
          ),
        );
      },
    );

    on<ProductTagSelectedEvent>((event, emit) {
      var productOfTag = products
          .where((x) => x.product.productTag.value?.id == event.tagSelected.id)
          .toList();
      emit(
        ProductTagSelectedState(
          tagSelected: event.tagSelected,
          listOfProduct: productOfTag,
          listOfProductRecommended: listOfProductRecommended,
          listOfProductTag: tags,
        ),
      );
    });
  }
}
