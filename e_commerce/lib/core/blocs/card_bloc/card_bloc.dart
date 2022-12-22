import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/database/entities/card/card_entity.dart';
import 'package:e_commerce/core/services/interfaces/icard_service.dart';
import 'package:e_commerce/core/utils/string_extension.dart';
import 'package:e_commerce/global/app_text.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    final _cardService = locator<ICardService>();

    on<CardLoadEvent>((event, emit) {
      var cards = _cardService.getCards();
      emit(CardLoadedState(cards: cards));
    });

    on<InsertCardEvent>((event, emit) async {
      var result = _checkCardData(event).entries.first;
      if (result.key) {
        var card = CardEntity(
            cardHolderName: event.cardHolderName,
            cardNumber: event.cardNumber,
            date: event.date!,
            cVV: event.cvv!);
        await _cardService.insertCard(card);
        add(CardLoadEvent());
      } else {
        String instance = const Uuid().v4();
        emit(InsertCardFailed(message: result.value, instance: instance));
      }
    });

    on<RemoveCardEvent>((event, emit) async {
      await _cardService.deleteCard(event.card);
      add(CardLoadEvent());
    });
  }

  Map<bool, String> _checkCardData(InsertCardEvent event) {
    if (event.cardHolderName.isNullOrEmpty()) {
      return {false: AppText.lblCardHolderNameIsEmpty};
    }
    if (event.cardNumber.isNullOrEmpty()) {
      return {false: AppText.lblCardNumberIsEmpty};
    }
    if (event.date == null) return {false: AppText.lblDateIsEmpty};
    if (event.cvv == null) return {false: AppText.lblCvvIsEmpty};
    return {true: ''};
  }
}
