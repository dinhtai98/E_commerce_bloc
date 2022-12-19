part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class BasketInitEvent extends BasketEvent {
  const BasketInitEvent();
}

class AddBasketItemEvent extends BasketEvent {
  final Product product;
  final int quantity;
  const AddBasketItemEvent({required this.product, this.quantity = 1});
}

class RemoveBasketItemEvent extends BasketEvent {
  final int basketId;
  const RemoveBasketItemEvent({required this.basketId});
}

class UpdateBasketItemEvent extends BasketEvent {
  final int basketId;
  final int quantity;
  const UpdateBasketItemEvent({required this.basketId, required this.quantity});
}

class ClearBasketItemEvent extends BasketEvent {}
