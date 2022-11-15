part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountInitEvent extends AccountEvent {
  const AccountInitEvent();
}

class InsertAccountEvent extends AccountEvent {
  final Account account;
  const InsertAccountEvent({required this.account});
  @override
  List<Object> get props => [account];
}
