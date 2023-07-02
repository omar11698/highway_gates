import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/signout_usecase.dart';

part 'first_screen_event.dart';
part 'first_screen_state.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
  final SignOutUseCase signOutUseCase;
  FirstScreenBloc({required this.signOutUseCase}) : super(FirstScreenInitial()) {
    on<FirstScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignOutBtnClickedEvent>((event, emit) async{
     await handleUserSignedOutEvent(event,emit);
    });



  }

   handleUserSignedOutEvent(SignOutBtnClickedEvent event, Emitter<FirstScreenState> emit)async {
    emit(FirstScreenSignOutLoadingState());
    (await signOutUseCase.call()).fold(
          (l) => emit( FirstScreenSignOutFailedState()),
          (r) => emit( FirstScreenSignOutSuccessState()),
    );

  }
}
