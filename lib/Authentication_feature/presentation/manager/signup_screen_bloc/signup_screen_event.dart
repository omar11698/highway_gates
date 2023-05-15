part of 'signup_screen_bloc.dart';

@immutable
abstract class SignupScreenEvent {}

class UserTypingEmailEvent extends SignupScreenEvent{
  final String email;
  UserTypingEmailEvent({required this.email});
}
class UserTypingNameEvent extends SignupScreenEvent{
  final String name;
  UserTypingNameEvent({required this.name});
}
class UserTypingPasswordEvent extends SignupScreenEvent{
  final String password;
  UserTypingPasswordEvent({required this.password});
}
class UserTypingVerifyPasswordEvent extends SignupScreenEvent{
  final String verifyPassword;
  UserTypingVerifyPasswordEvent({required this.verifyPassword,});
}
class UserSignUpBtnClicked extends SignupScreenEvent{}
class SignupScreenInitialEvent extends SignupScreenEvent{}
