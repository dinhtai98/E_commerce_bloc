import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

abstract class BaseEntity {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  String? uid;
  BaseEntity({this.uid}) {
    uid ??= const Uuid().v4();
  }
}
