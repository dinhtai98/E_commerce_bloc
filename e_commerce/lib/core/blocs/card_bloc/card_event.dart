part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object?> get props => [];
}

class CardLoadEvent extends CardEvent {}

class InsertCardEvent extends CardEvent {
  final String cardHolderName;
  final String cardNumber;
  final DateTime? date;
  final DateTime? cvv;

  const InsertCardEvent({
    required this.cardHolderName,
    required this.cardNumber,
    required this.date,
    required this.cvv,
  });
}

class RemoveCardEvent extends CardEvent {
  final CardEntity card;

  const RemoveCardEvent({required this.card});
  @override
  List<Object> get props => [card];
}
