import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/database/entities/delivery/delivery_entity.dart';
import 'package:e_commerce/core/services/interfaces/idelivery_serivce.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:equatable/equatable.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  DeliveryBloc() : super(DeliveryInitial()) {
    final _deliveryService = locator<IDeliveryService>();
    on<DeliveryInitEvent>((event, emit) {
      var deliveries = _deliveryService.getDeliveries();
      emit(DeliveryLoadedState(deliveries: deliveries));
    });

    on<AddDeliveryEvent>((event, emit) async {
      await _deliveryService.insertDelivery(event.delivery);
      add(const DeliveryInitEvent());
    });

    on<RemoveDeliveryEvent>((event, emit) async {
      await _deliveryService.deleteDelivery(event.delivery);
      var deliveries = _deliveryService.getDeliveries();
      if (deliveries.length == 1) {
        var lastDelivery = deliveries.last;
        lastDelivery.isDefault = true;
        await _deliveryService.updateDelivery(lastDelivery);
      }
      add(const DeliveryInitEvent());
    });

    on<SelectedDeliveryEvent>((event, emit) async {
      var deliveries = _deliveryService.getDeliveries();
      for (var delivery in deliveries) {
        if (delivery.id == event.delivery.id) {
          delivery.isDefault = true;
        } else {
          delivery.isDefault = false;
        }
        await _deliveryService.updateDelivery(delivery);
      }
      add(const DeliveryInitEvent());
    });
  }
}
