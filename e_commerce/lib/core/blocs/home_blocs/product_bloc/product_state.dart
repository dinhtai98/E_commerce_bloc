part of 'product_bloc.dart';

abstract class ProductBlocState extends Equatable {
  final List<ProductUIModel> listOfProduct;
  final List<ProductUIModel> listOfProductRecommended;
  final List<ProductTag> listOfProductTag;
  final ProductTag? productTagSelected;
  const ProductBlocState({
    required this.listOfProduct,
    required this.listOfProductRecommended,
    required this.listOfProductTag,
    this.productTagSelected,
  });

  @override
  List<Object?> get props => [
        listOfProduct,
        listOfProductRecommended,
        listOfProductTag,
        productTagSelected,
      ];
}

class ProductBlocInitial extends ProductBlocState {
  ProductBlocInitial()
      : super(
          listOfProduct: [],
          listOfProductRecommended: [],
          listOfProductTag: [],
          productTagSelected: null,
        );
}

class ProductLoadedState extends ProductBlocState {
  const ProductLoadedState({
    required List<ProductUIModel> listOfProduct,
    required List<ProductUIModel> listOfProductRecommended,
    required List<ProductTag> listOfProductTag,
  }) : super(
          listOfProduct: listOfProduct,
          listOfProductRecommended: listOfProductRecommended,
          listOfProductTag: listOfProductTag,
          productTagSelected: null,
        );
}

class ProductTagSelectedState extends ProductBlocState {
  const ProductTagSelectedState({
    required ProductTag tagSelected,
    required List<ProductUIModel> listOfProduct,
    required List<ProductUIModel> listOfProductRecommended,
    required List<ProductTag> listOfProductTag,
  }) : super(
          listOfProduct: listOfProduct,
          listOfProductRecommended: listOfProductRecommended,
          listOfProductTag: listOfProductTag,
          productTagSelected: tagSelected,
        );
}
