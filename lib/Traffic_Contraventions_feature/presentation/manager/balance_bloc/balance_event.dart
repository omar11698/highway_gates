part of 'balance_bloc.dart';

@immutable
abstract class BalanceEvent {}
class PayWithBalanceEvent extends BalanceEvent{
  final String balance;
  final String? newGharama;
  PayWithBalanceEvent({required this.balance,required this.newGharama});

}
class AddCurrentBalanceAndPayWithBalanceEvent extends BalanceEvent{
  final String balance;
  AddCurrentBalanceAndPayWithBalanceEvent({required this.balance});

}
class PayButtonClicked extends BalanceEvent{
final int balance;
final int ghrama;
PayButtonClicked({required this.balance,required this.ghrama,});

}


