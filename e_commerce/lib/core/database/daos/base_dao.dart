import 'package:e_commerce/core/database/entities/base_entity.dart';
import 'package:e_commerce/core/database/isar_database.dart';
import 'package:e_commerce/global/locator.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

abstract class BaseDao<T extends BaseEntity> {
  @protected
  late IsarCollection<T> collection;
  BaseDao() {
    collection = locator<IsarDatabase>().isar!.getCollection();
  }

  Future<void> insert(T entity) async {
    try {
      await collection.isar.writeTxn((isar) => collection.put(entity));
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> insertAll(List<T> entities) async {
    try {
      await collection.isar.writeTxn((isar) => collection.putAll(entities));
      // ignore: empty_catches
    } catch (e) {}
  }

  T? findById(int id) {
    return collection.getSync(id);
  }

  Future<void> updateById(int id, T entity) async {
    await collection.isar.writeTxn((isar) async {
      entity.id = await collection.put(entity);
    });
  }

  List<T> getAllCollection() {
    return collection.where().findAllSync();
  }

  Future<void> deleteById(int id) async {
    await collection.isar.writeTxn((b) async {
      await collection.delete(id);
    });
  }

  void clearCollection() {
    collection.clearSync();
  }
}
