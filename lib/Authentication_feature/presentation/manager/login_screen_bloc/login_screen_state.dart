part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenState {
  final String messages;

  const LoginScreenState({required this.messages});
}

class LoginScreenInitial extends LoginScreenState {
  const LoginScreenInitial({required super.messages});}
class LoginScreenEmailState extends LoginScreenState {
  const LoginScreenEmailState({required super.messages});
}
class LoginScreenPasswordState extends LoginScreenState {
  const LoginScreenPasswordState({required super.messages});
}

class LoginFailedState extends LoginScreenState {
  const LoginFailedState({required super.messages});
}
class LoginSuccessState extends LoginScreenState {
  const LoginSuccessState({required super.messages});
}
class LoginLoadingState extends LoginScreenState {
  const LoginLoadingState({required super.messages});
}


// class LoginScreenCheckingState extends LoginScreenState {
//   final String messages;
//    LoginScreenCheckingState({required this.messages});
// }
// class LoginScreenInitCheckingState extends LoginScreenState {
//   final String messages;
//   LoginScreenInitCheckingState({required this.messages});
// }
// class LoginScreenCheckedState extends LoginScreenState {
//   final String messages;
//   LoginScreenCheckedState({required this.messages});
// }
//
// class LoginPasswordScreenCheckingState extends LoginScreenState {
//   final String messages;
//   LoginPasswordScreenCheckingState({required this.messages, required password});
// }
// class LoginPasswordInitCheckingState extends LoginScreenState {
//   final String messages;
//   LoginPasswordInitCheckingState({required this.messages});
// }
// class LoginPasswordCheckedState extends LoginScreenState {
//   final String messages;
//   LoginPasswordCheckedState({required this.messages, required password});
// }
//
//
// class LoginScreenSuccessfullyState extends LoginScreenState {
//   final String message;
//    LoginScreenSuccessfullyState({required this.message});
// }
// class FailedLoginScreenState extends LoginScreenState {
//
//   final String message;
//
//    FailedLoginScreenState({required this.message});
// }
