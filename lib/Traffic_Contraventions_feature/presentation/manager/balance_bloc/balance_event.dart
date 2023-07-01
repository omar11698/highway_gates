part of 'balance_bloc.dart';

@immutable
abstract class BalanceEvent {}
class PayWithBalanceEvent extends BalanceEvent{
  final String balance;
  PayWithBalanceEvent({required this.balance});

}


