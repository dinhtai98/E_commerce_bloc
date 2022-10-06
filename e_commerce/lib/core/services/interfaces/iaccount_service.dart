import 'package:e_commerce/core/database/entities/account_entity.dart';

abstract class IAccountService {
  List<Account> getAccounts();
  Account? findAccountById(int id);
  Future<void> insertAccount(Account account);
  Future<void> deleteAccount(Account account);
  Future<void> updateAccount(Account account);
}
