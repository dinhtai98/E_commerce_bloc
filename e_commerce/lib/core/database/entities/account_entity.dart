import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:isar/isar.dart';

part 'account_entity.g.dart';

@collection
// ignore: must_be_immutable
class Account extends BaseEntity {
  late String name;
  Account({
    String? uid,
    required this.name,
  }) : super(uid: uid);
}
