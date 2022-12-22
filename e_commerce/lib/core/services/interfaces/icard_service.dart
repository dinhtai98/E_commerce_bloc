import 'package:e_commerce/core/database/entities/card/card_entity.dart';

abstract class ICardService {
  List<CardEntity> getCards();
  CardEntity? findCardById(int id);
  Future<void> insertCard(CardEntity card);
  Future<void> deleteCard(CardEntity card);
  Future<void> updateCard(CardEntity card);
}
