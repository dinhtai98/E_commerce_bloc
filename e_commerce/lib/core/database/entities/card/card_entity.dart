import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:isar/isar.dart';

part 'card_entity.g.dart';

@Collection(inheritance: false)
// ignore: must_be_immutable
class CardEntity extends BaseEntity {
  @override
  Id id;
  late String cardHolderName;
  late String cardNumber;
  late DateTime date;
  late DateTime cVV;
  CardEntity({
    String? uid,
    required this.cardHolderName,
    required this.cardNumber,
    required this.date,
    required this.cVV,
  })  : id = Isar.autoIncrement,
        super(uid: uid);
  @ignore
  @override
  List<Object?> get props => [cardHolderName, cardNumber, date, cVV];
}
