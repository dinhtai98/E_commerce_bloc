import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:isar/isar.dart';

part 'delivery_entity.g.dart';

@Collection(inheritance: false)
// ignore: must_be_immutable
class Delivery extends BaseEntity {
  @override
  Id id;
  late String address;
  late String phoneNumber;
  bool isDefault;
  Delivery({
    String? uid,
    required this.address,
    required this.phoneNumber,
    this.isDefault = false,
  })  : id = Isar.autoIncrement,
        super(uid: uid);

  @ignore
  @override
  List<Object?> get props => [address, phoneNumber, isDefault];
}
