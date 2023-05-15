
import 'package:bloc/bloc.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/create_user_usecase.dart';
import 'package:highway_gates/Core/constants/strings.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user.dart';

part 'signup_screen_event.dart';
part 'signup_screen_state.dart';

class SignupScreenBloc extends Bloc<SignupScreenEvent, SignupScreenState> {

  final CreateUserUseCase createUserUseCase;
  User user=const User(id:'', email: '', messages: '', password: '', name: '', token: '', phone: '', creditCardNumber: '', image: '');

  SignupScreenBloc(this.createUserUseCase) : super(SignupScreenInitial()) {

    on<SignupScreenEvent>((event, emit) async {
          emit(SignupScreenInitial());
    });



    on<UserTypingNameEvent>((event, emit) async{

      if (event.name.isEmpty ) {
        emit(
          SignupScreenCheckingNameState(messages: "please Enter a valid Name"),
        );
      }
      user=user.copyWith(name:event.name,);
      return emit(SignupScreenCheckingEmailState(messages: emptyString));
      }

    );

    on<UserTypingEmailEvent>((event, emit) async{

      if (event.email.isEmpty || !event.email.contains("@")) {
        emit(
          SignupScreenCheckingEmailState(messages: "please Enter a valid email"),
        );
      }
      user=user.copyWith(name: '', email: event.email, password: '');
      return emit(SignupScreenCheckingEmailState(messages: emptyString));

      }

    );

    on<UserTypingPasswordEvent>((event, emit) async{

      if (event.password.isEmpty || event.password.length < 8) {
        emit(
          SignupScreenCheckingPasswordState(
            messages: "your password is less than 8 digits",
            password: event.password,
          ),
        );
      }
      user.copyWith(password: event.password);
      return emit(SignupScreenCheckingPasswordState(messages: emptyString, password: event.password));

       }

    );

    on<UserTypingVerifyPasswordEvent>((event, emit) async{

      if (user.password != event.verifyPassword) {
        emit(SignupScreenVerifyingPasswordState(
          messages: "your passwords are not matching",
        ));
      }
      return emit(SignupScreenVerifyingPasswordState(
        messages: "verified",
      ));

      }

    );


    on<UserSignUpBtnClicked>((event, emit) async{
      emit(SignupScreenSigningUserUpState());
      (await createUserUseCase.call(user)).fold((l) => emit(FailedSignupScreenState()), (r) => emit(SignupScreenSuccessfullySignedUpState()));
      }

    );

  }
}
