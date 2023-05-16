import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/create_user_usecase.dart';
import 'package:highway_gates/Core/constants/strings.dart';
import '../../../domain/entities/user.dart';
part 'signup_screen_event.dart';
part 'signup_screen_state.dart';

class SignupScreenBloc extends Bloc<SignupScreenEvent, SignupScreenState> {
  final CreateUserUseCase createUserUseCase;
  User user = const User(id: '', email: '', messages: '', password: '', name: '', token: '', phone: '', creditCardNumber: '', image: '', isValidEmail: false, isValidPassword: false);

  SignupScreenBloc(this.createUserUseCase) : super(SignupScreenInitial()) {
    on<UserTypingNameEvent>((event, emit) async {
      emit(
        const SignupScreenCheckingNameState(messages: "please Enter a valid Name "),
      );
      debugPrint("this is the name ${event.name}");
      if (event.name.trim().isEmpty) {
        emit(
           const SignupScreenCheckingNameState(messages: "please Enter a valid Name "),
        );
      }
     else{
        user = user.copyWith(
          name: event.name,
        );

        emit(const SignupScreenCheckingNameState(messages: emptyString));
      }
    });

    on<UserTypingEmailEvent>((event, emit) async {
        emit(const SignupScreenInitCheckingEmailState(messages: '',));

      if (event.email.trim().isNotEmpty && event.email.contains("@yahoo.com")||event.email.contains("@gmail.com")) {
        user = user.copyWith(email: event.email, isValidEmail: true);
        debugPrint("*******this is the validation email ${user.isValidEmail}");
        emit(const SignupScreenCheckedEmailState(messages: emptyString, isValidEmail: true));
      }

      else if (event.email.isEmpty || !event.email.contains("@yahoo.com")||!event.email.contains("@gmail.com")) {
        user=user.copyWith(isValidEmail: false);
        emit(
          const SignupScreenCheckingEmailState(messages: "please Enter a valid email", isValidEmail: false),
        );
      }

    });

    on<UserTypingPasswordEvent>((event, emit) async {

      emit(const SignupScreenInitCheckingPasswordState(messages: '',));
      if (event.password.length < 8) {
        emit(
          SignupScreenCheckingPasswordState(
            messages: "your password is less than 8 digits",
            password: event.password,
          ),
        );
      }else if (event.password.length>=8){
        user = user.copyWith(password: event.password);
        emit(SignupScreenCheckedPasswordState(messages: emptyString, password: event.password));
      }

    });

    on<UserTypingVerifyPasswordEvent>((event, emit) async {
      if (user.password != event.verifyPassword) {
        emit(const SignupScreenVerifyingPasswordState(
          messages: "your passwords are not matching",
        ));
      } else {
        user = user.copyWith(isValidPassword: true);
        emit(const SignupScreenVerifyingPasswordState(
          messages: "verified",
        ));
      }
    });

    on<UserSignUpBtnClickedEvent>((event, emit) async {
      emit(SignupScreenSigningUserUpState());
      if (user.isValidEmail == true&&user.isValidPassword==true) {
        (await createUserUseCase.call(user)).fold(
          (l) => emit( const FailedSignupScreenState(message: 'FireBase Error')),
          (r) => emit( const SignedUpScreenSuccessfullySignedUpState(message: 'signed up successfully')),
        );
      } else {
        emit( const FailedSignupScreenState(message: 'check inputs again'));
      }
      emit(SignupScreenInitial());
    });

    @override
    void onTransition(Transition<SignupScreenEvent, SignupScreenState> transition) {
      super.onTransition(transition);
      debugPrint(transition.toString());
    }
  }
}
