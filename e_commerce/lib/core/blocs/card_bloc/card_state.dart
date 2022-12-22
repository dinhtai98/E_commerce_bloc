part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();

  @override
  List<Object?> get props => [];
}

class CardInitial extends CardState {}

class CardLoadedState extends CardState {
  final List<CardEntity> cards;

  const CardLoadedState({required this.cards});

  @override
  List<Object?> get props => [cards];
}

class InsertCardFailed extends CardState {
  final String instance;
  final String message;

  const InsertCardFailed({required this.message, required this.instance});
  @override
  List<Object?> get props => [instance, message];
}
