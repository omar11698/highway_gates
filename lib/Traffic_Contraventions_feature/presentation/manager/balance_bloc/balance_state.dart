part of 'balance_bloc.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}
class CalculatingBalance extends BalanceState{}
class BalanceCalculationSuccess extends BalanceState {
  final String balance;
  BalanceCalculationSuccess({required this.balance,});
}
class BalanceCalculationFailed extends BalanceState {}

