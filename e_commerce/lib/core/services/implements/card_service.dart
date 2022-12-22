import 'package:e_commerce/core/database/daos/card_dao.dart';
import 'package:e_commerce/core/database/entities/card/card_entity.dart';
import 'package:e_commerce/core/services/interfaces/icard_service.dart';
import 'package:e_commerce/global/locator.dart';

class CardService implements ICardService {
  final _cardDao = locator<CardDao>();
  @override
  Future<void> deleteCard(CardEntity card) async {
    await _cardDao.deleteById(card.id);
  }

  @override
  CardEntity? findCardById(int id) {
    return _cardDao.findById(id);
  }

  @override
  List<CardEntity> getCards() {
    return _cardDao.getAllCollection();
  }

  @override
  Future<void> insertCard(CardEntity card) async {
    await _cardDao.insert(card);
  }

  @override
  Future<void> updateCard(CardEntity card) async {
    await _cardDao.updateById(card.id, card);
  }
}
