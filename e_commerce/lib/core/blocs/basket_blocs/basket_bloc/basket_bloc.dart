import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/database/entities/basket_items/basket_item_entity.dart';
import 'package:e_commerce/core/database/entities/products/product_entity.dart';
import 'package:e_commerce/core/services/interfaces/ibasket_service.dart';
import 'package:e_commerce/core/utils/list_extension.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final _basketService = locator<IBasketService>();

  double getTotalPrice(List<BasketItem> basketItems) {
    double _totalPrice = 0;
    for (var item in basketItems) {
      _totalPrice += item.price * item.quantity;
    }
    return _totalPrice;
  }

  BasketBloc() : super(const BasketInitialState()) {
    on<BasketInitEvent>((event, emit) async {
      var basketItems = _basketService.getBasketItems();
      emit(BasketLoadedState(
        basketItems: basketItems,
        totalPrice: getTotalPrice(basketItems),
      ));
    });

    on<AddBasketItemEvent>((event, emit) async {
      var basketItems = _basketService.getBasketItems();
      var existBasketItem =
          basketItems.firstOrDefault((x) => x.productId == event.product.id);
      if (existBasketItem != null) {
        add(UpdateBasketItemEvent(
            basketId: existBasketItem.id, quantity: event.quantity));
        return;
      }
      var product = event.product;
      var _basketItem = BasketItem(
        productId: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        comboName: '',
        quantity: event.quantity,
        productUid: product.uid,
      );
      await _basketService.addBasketItem(_basketItem);
    });

    on<RemoveBasketItemEvent>((event, emit) async {
      await _basketService.removeBasketItem(event.basketId);
      add(const BasketInitEvent());
    });

    on<ClearBasketItemEvent>((event, emit) async {
      await _basketService.clearBasket();
      add(const BasketInitEvent());
    });

    on<UpdateBasketItemEvent>((event, emit) async {
      var basketItem = _basketService.findBasketById(event.basketId);
      if (basketItem == null) return;
      basketItem.quantity += event.quantity;
      if (basketItem.quantity <= 0) {
        add(RemoveBasketItemEvent(basketId: basketItem.id));
        return;
      }
      await _basketService.updateBasket(basketItem);
      add(const BasketInitEvent());
    });
  }
}
