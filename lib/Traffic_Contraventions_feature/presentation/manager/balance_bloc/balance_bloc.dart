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

    on<AddCurrentBalanceAndPayWithBalanceEvent>((event, emit) {
      handleAddCurrentBalanceAndPayWithBalanceEvent(event,emit);
    });

    on<PayButtonClicked>((event,emit)=>handlePayButtonClickedEvent(event,emit));


  }




  handlePayButtonClickedEvent(PayButtonClicked event, Emitter<BalanceState> emit) {

    if(event.balance!=0){
      emit(PayWithBalanceSuccess(balance: event.balance.toString(), ghrama: 0.toString()));
    }





  }
}

void handleAddCurrentBalanceAndPayWithBalanceEvent(AddCurrentBalanceAndPayWithBalanceEvent event, Emitter<BalanceState> emit) {
emit(CalculatingBalance());
if(int.parse(event.balance)>=0){
  emit(BalanceCalculationSuccess(balance:event.balance, ghrama: null,));
}

else{
  emit(BalanceCalculationFailed());

}

}

void handlePayWithBalanceEvent(PayWithBalanceEvent event, Emitter<BalanceState> emit) {
  emit(CalculatingBalance());

  if(int.parse(event.balance)!=0){
    emit(BalanceCalculationSuccess(balance:event.balance,ghrama:null));
  }
  else if (int.parse(event.balance)==0){
    emit(BalanceCalculationFailed());
  }
  else{
    emit(BalanceCalculationFailed());

  }
}
