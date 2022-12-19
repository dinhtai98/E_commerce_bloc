import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:isar/isar.dart';

part 'account_entity.g.dart';

@Collection(inheritance: false)
// ignore: must_be_immutable
class Account extends BaseEntity {
  @override
  Id id;
  late String name;
  Account({
    String? uid,
    required this.name,
  })  : id = Isar.autoIncrement,
        super(uid: uid);
  @ignore
  @override
  List<Object?> get props => [name];
}
