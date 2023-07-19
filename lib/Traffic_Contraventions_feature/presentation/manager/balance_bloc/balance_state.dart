part of 'balance_bloc.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}
class CalculatingBalance extends BalanceState{}
class BalanceCalculationSuccess extends BalanceState {
  final String balance;
  final String? ghrama;
  BalanceCalculationSuccess({required this.balance,required this.ghrama,});
}
class BalanceCalculationFailed extends BalanceState {}

class PayWithBalanceSuccess extends BalanceState {
  final String balance;
  final String? ghrama;
  PayWithBalanceSuccess({required this.balance,required this.ghrama,});
}