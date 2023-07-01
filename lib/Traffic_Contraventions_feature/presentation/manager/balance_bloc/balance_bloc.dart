import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceInitial()) {

    on<PayWithBalanceEvent>((event, emit) {
        handlePayWithBalanceEvent(event,emit);
    });

  }
}

void handlePayWithBalanceEvent(PayWithBalanceEvent event, Emitter<BalanceState> emit) {
  emit(CalculatingBalance());

  if(int.parse(event.balance)!=0){
    emit(BalanceCalculationSuccess(balance:event.balance,));
  }
  else if (int.parse(event.balance)==0){
    emit(BalanceCalculationFailed());
  }
  else{
    emit(BalanceCalculationFailed());

  }
}
