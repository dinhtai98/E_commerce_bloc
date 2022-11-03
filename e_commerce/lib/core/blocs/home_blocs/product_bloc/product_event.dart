part of 'product_bloc.dart';

abstract class ProductBlocEvent extends Equatable {
  const ProductBlocEvent();

  @override
  List<Object> get props => [];
}

class ProductInitEvent extends ProductBlocEvent {
  const ProductInitEvent();
}

class ProductTagSelectedEvent extends ProductBlocEvent {
  final ProductTag tagSelected;
  const ProductTagSelectedEvent({required this.tagSelected});
  @override
  List<Object> get props => [tagSelected];
}
