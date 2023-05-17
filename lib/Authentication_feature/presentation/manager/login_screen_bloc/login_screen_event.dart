part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {
}
class LoginUserTypedEmailEvent extends LoginScreenEvent{
  final String email;
  LoginUserTypedEmailEvent({required this.email});
}
class LoginUserTypedPasswordEvent extends LoginScreenEvent{
  final String password;
  LoginUserTypedPasswordEvent({required this.password});
}
class LoginBtnClickedEvent extends LoginScreenEvent{
final String email;
final  String password;

  LoginBtnClickedEvent({required this.email,required this.password});
}
class GoogleBtnClickedEvent extends LoginScreenEvent{
  GoogleBtnClickedEvent();
}














// class LogInScreenEmailInitialEvent extends LoginScreenEvent{}
// class UserLoggingEmailEvent extends LoginScreenEvent{
//   final String email;
//   UserLoggingEmailEvent({required this.email});
// }
// class UserLoggedEmailSuccessfullyEvent extends LoginScreenEvent{
//   final String email;
//   UserLoggedEmailSuccessfullyEvent({required this.email});
// }
// class UserLoggedEmailFailedEvent extends LoginScreenEvent{
//   final String email;
//   UserLoggedEmailFailedEvent({required this.email});
// }
//
// class LogInScreenPasswordInitialEvent extends LoginScreenEvent{}
// class UserLoggingPasswordEvent extends LoginScreenEvent{
//   final String email;
//
//   var password;
//   UserLoggingPasswordEvent({required this.email});
// }
// class UserLoggedPasswordSuccessfullyEvent extends LoginScreenEvent{
//   final String email;
//   UserLoggedPasswordSuccessfullyEvent({required this.email});
// }
// class UserLoggedPasswordFailedEvent extends LoginScreenEvent{
//   final String email;
//   UserLoggedPasswordFailedEvent({required this.email});
// }