import 'package:e_commerce/core/database/daos/account_dao.dart';
import 'package:e_commerce/core/database/entities/account_entity.dart';
import 'package:e_commerce/core/services/interfaces/iaccount_service.dart';
import 'package:e_commerce/global/locator.dart';

class AccountService implements IAccountService {
  final _accountDao = locator<AccountDao>();

  @override
  Future<void> deleteAccount(Account account) async {
    await _accountDao.deleteById(account.id);
  }

  @override
  Account? findAccountById(int id) {
    return _accountDao.findById(id);
  }

  @override
  List<Account> getAccounts() {
    return _accountDao.getAllCollection();
  }

  @override
  Future<void> insertAccount(Account account) async {
    await _accountDao.insert(account);
  }

  @override
  Future<void> updateAccount(Account account) async {
    await _accountDao.updateById(account.id, account);
  }
}
