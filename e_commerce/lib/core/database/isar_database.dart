import 'package:e_commerce/core/database/entities/account_entity.dart';
import 'package:e_commerce/core/utils/storage_utils.dart';
import 'package:isar/isar.dart';

class IsarDatabase {
  IsarDatabase();
  Isar? isar;

  static List<CollectionSchema<dynamic>> schemas = [AccountSchema];
  Future<void> init() async {
    var storage = await StorageUtils.getApplicationPermanentDirectory();
    isar ??= await Isar.open(
      schemas: schemas,
      directory: storage.path + "/isar",
      inspector: true, // if you want to enable the inspector for debug builds
    );
  }
}
