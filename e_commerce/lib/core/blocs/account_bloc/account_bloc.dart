import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/database/entities/account_entity.dart';
import 'package:e_commerce/core/services/interfaces/iaccount_service.dart';
import 'package:e_commerce/core/utils/list_extension.dart';
import 'package:e_commerce/global/global_data.dart';
import 'package:e_commerce/global/locator.dart';

import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final _accountService = locator<IAccountService>();
  final _globalData = locator<GlobalData>();
  AccountBloc() : super(const AccountState.initial()) {
    on<AccountInitEvent>((event, emit) {
      var account = _accountService.getAccounts().firstOrDefault((x) => true);
      if (account != null) {
        _globalData.currentAccount = account;
        emit(AccountState.accountLoaded(account));
      }
    });

    on<InsertAccountEvent>((event, emit) {
      var newAccount = event.account;
      _accountService.insertAccount(newAccount);
      _globalData.currentAccount = newAccount;
      emit(state.copyWith(currentAccount: newAccount));
    });
  }
}
