part of 'signup_screen_bloc.dart';

@immutable
abstract class SignupScreenState {
const SignupScreenState();
}

class SignupScreenInitial extends SignupScreenState {}
class SignupScreenSigningUserUpState extends SignupScreenState {}
class SignedUpScreenSuccessfullySignedUpState extends SignupScreenState {
  final String message;
  const SignedUpScreenSuccessfullySignedUpState({required this.message});
}
class FailedSignupScreenState extends SignupScreenState {

  final String message;

  const FailedSignupScreenState({required this.message});
}

class SignupScreenCheckingNameState extends SignupScreenState {
  final String messages;
  const SignupScreenCheckingNameState({required this.messages});
}
class SignupScreenCheckingEmailState extends SignupScreenState {
  final String messages;
  final bool isValidEmail;

  const SignupScreenCheckingEmailState( {required this.messages,required this.isValidEmail,});
}
class SignupScreenCheckedEmailState extends SignupScreenState {
  final String messages;
  final bool isValidEmail;

  const SignupScreenCheckedEmailState( {required this.messages,required this.isValidEmail,});
}
class SignupScreenInitCheckingEmailState extends SignupScreenState {
  final String messages;
  const SignupScreenInitCheckingEmailState({required this.messages, });

}
class SignupScreenInitCheckingPasswordState extends SignupScreenState {
  final String messages;
  const SignupScreenInitCheckingPasswordState({required this.messages,});

}
class SignupScreenCheckedPasswordState extends SignupScreenState {
  final String messages;
  const SignupScreenCheckedPasswordState({required this.messages, required String password});

}

class SignupScreenCheckingPasswordState extends SignupScreenState {
  final String messages;
  const SignupScreenCheckingPasswordState({required this.messages, required String password});

}
class SignupScreenVerifyingPasswordState extends SignupScreenState {
  final String messages;
  const SignupScreenVerifyingPasswordState({required this.messages,});
}




