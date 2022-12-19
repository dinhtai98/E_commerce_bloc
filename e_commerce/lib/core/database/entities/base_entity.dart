// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

abstract class BaseEntity extends Equatable {
  @Index(unique: true)
  String? uid;
  BaseEntity({
    this.uid,
  }) {
    uid ??= const Uuid().v4();
  }

  Id get id;
  set id(Id value);
}
