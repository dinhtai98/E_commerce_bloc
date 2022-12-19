part of 'product_bloc.dart';

class ProductBlocState extends Equatable {
  final List<ProductUIModel> listOfProduct;
  final List<ProductUIModel> listOfProductRecommended;
  final List<ProductTag> listOfProductTag;
  final ProductTag? tagSelected;
  const ProductBlocState._({
    this.listOfProduct = const [],
    this.listOfProductRecommended = const [],
    this.listOfProductTag = const [],
    this.tagSelected,
  });

  const ProductBlocState.initial() : this._();
  const ProductBlocState.productLoadSuccess({
    required List<ProductUIModel> listOfProduct,
    required List<ProductUIModel> listOfProductRecommended,
    required List<ProductTag> listOfProductTag,
  }) : this._(
          listOfProduct: listOfProduct,
          listOfProductRecommended: listOfProductRecommended,
          listOfProductTag: listOfProductTag,
        );

  @override
  List<Object?> get props =>
      [listOfProduct, listOfProductRecommended, listOfProductTag, tagSelected];

  ProductBlocState copyWith({
    List<ProductUIModel>? listOfProduct,
    List<ProductUIModel>? listOfProductRecommended,
    List<ProductTag>? listOfProductTag,
    ProductTag? tagSelected,
  }) {
    return ProductBlocState._(
      listOfProduct: listOfProduct ?? this.listOfProduct,
      listOfProductRecommended:
          listOfProductRecommended ?? this.listOfProductRecommended,
      listOfProductTag: listOfProductTag ?? this.listOfProductTag,
      tagSelected: tagSelected ?? this.tagSelected,
    );
  }

  @override
  String toString() {
    return 'ProductBlocState(listOfProduct: $listOfProduct, listOfProductRecommended: $listOfProductRecommended, listOfProductTag: $listOfProductTag, tagSelected: $tagSelected, tagSelected]: $tagSelected])';
  }
}
