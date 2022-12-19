part of 'basket_bloc.dart';

abstract class BasketState {
  const BasketState();
}

class BasketInitialState extends BasketState {
  const BasketInitialState();
}

class BasketLoadedState extends BasketState {
  final List<BasketItem> basketItems;
  final double totalPrice;

  const BasketLoadedState(
      {required this.basketItems, required this.totalPrice});

  @override
  String toString() =>
      'BasketLoadedState(basketItems: $basketItems, totalPrice: $totalPrice)';
}
