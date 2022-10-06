import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

abstract class BaseEntity {
  int id = Isar.autoIncrement;
  String? uid;
  BaseEntity({this.uid}) {
    uid ??= const Uuid().v4();
  }
}
