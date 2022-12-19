part of 'delivery_bloc.dart';

abstract class DeliveryEvent extends Equatable {
  const DeliveryEvent();

  @override
  List<Object> get props => [];
}

class DeliveryInitEvent extends DeliveryEvent {
  const DeliveryInitEvent();
}

class AddDeliveryEvent extends DeliveryEvent {
  final Delivery delivery;

  const AddDeliveryEvent({required this.delivery});
}

class RemoveDeliveryEvent extends DeliveryEvent {
  final Delivery delivery;

  const RemoveDeliveryEvent({required this.delivery});
}

class SelectedDeliveryEvent extends DeliveryEvent {
  final Delivery delivery;
  const SelectedDeliveryEvent({required this.delivery});
}
