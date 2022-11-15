part of 'account_bloc.dart';

class AccountState extends Equatable {
  final Account? currentAccount;
  final bool? accountInserted;
  const AccountState._({this.currentAccount, this.accountInserted});
  const AccountState.initial() : this._();
  const AccountState.accountLoaded(Account currentAccount)
      : this._(currentAccount: currentAccount);
  const AccountState.insertAccountError(bool insertAccount)
      : this._(accountInserted: insertAccount);

  @override
  List<Object?> get props => [currentAccount, accountInserted];

  AccountState copyWith({
    Account? currentAccount,
    bool? accountInserted,
  }) {
    return AccountState._(
      currentAccount: currentAccount ?? this.currentAccount,
      accountInserted: accountInserted ?? this.accountInserted,
    );
  }
}
