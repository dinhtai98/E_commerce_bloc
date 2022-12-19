part of 'delivery_bloc.dart';

abstract class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object> get props => [];
}

class DeliveryInitial extends DeliveryState {}

class DeliveryLoadedState extends DeliveryState {
  final List<Delivery> deliveries;

  const DeliveryLoadedState({required this.deliveries});
  @override
  List<Object> get props => [deliveries];
}

class DeliverySelectedState extends DeliveryState {
  final Delivery delivery;

  const DeliverySelectedState({required this.delivery});
  @override
  List<Object> get props => [delivery];
}
