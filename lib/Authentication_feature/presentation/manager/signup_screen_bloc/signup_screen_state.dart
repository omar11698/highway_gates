part of 'signup_screen_bloc.dart';

@immutable
abstract class SignupScreenState {}

class SignupScreenInitial extends SignupScreenState {}
class SignupScreenCheckingEmailState extends SignupScreenState {
  final String messages;

  SignupScreenCheckingEmailState({required this.messages});
}
class SignupScreenCheckingPasswordState extends SignupScreenState {
  final String messages;

  SignupScreenCheckingPasswordState({required this.messages, required String password});

}
class SignupScreenVerifyingPasswordState extends SignupScreenState {
  final String messages;
  SignupScreenVerifyingPasswordState({required this.messages,});
}
class SignupScreenSigningUserUpState extends SignupScreenState {}
class SignupScreenCheckingNameState extends SignupScreenState {
  final String messages;

  SignupScreenCheckingNameState({required this.messages});
}
class SignupScreenSuccessfullySignedUpState extends SignupScreenState {}
class FailedSignupScreenState extends SignupScreenState {}


