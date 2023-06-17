import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/login_with_email_usecase.dart';
import 'package:meta/meta.dart';

import '../../../../Core/constants/strings.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/login_with_google_usecase.dart';
part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {

  final LoginWithEmailUseCase loginWithEmailUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginScreenBloc({required this.loginWithEmailUseCase,required this.loginWithGoogleUseCase}) : super(const LoginScreenInitial(messages: '')) {
    User loggingUser = const User(id: '', email: '', messages: '', password: '', name: '', token: '', phone: '', creditCardNumber: '', image: '', isValidEmail: false, isValidPassword: false);



    on<LoginScreenEvent>((event, emit) {});
    on<LoginBtnClickedEvent>((event, emit) async {
      await handleBtnClickedEvent(event,emit,loggingUser,loginWithEmailUseCase);
    });
    on<GoogleBtnClickedEvent>((event, emit) async {
      await handleGoogleBtnClickedEvent(event,emit,loggingUser,loginWithEmailUseCase);
    });
    on<LoginUserTypedEmailEvent>((event, emit) {
      handleEmailField(event, emit, loggingUser);
    });
    on<LoginUserTypedPasswordEvent>((event, emit) {
      handlePasswordField(event, emit, loggingUser);
    });





  }

  void handleEmailField(LoginUserTypedEmailEvent event, Emitter emit, User loggingUser) {
    emit(const LoginScreenEmailState(messages: ''));
    debugPrint("This is login user email:${event.email}");
    if (event.email.trim().isNotEmpty && event.email.contains("@yahoo.com") || event.email.contains("@gmail.com")) {
      debugPrint("the email is valid and we are ok with it ");
      loggingUser = loggingUser.copyWith(email: event.email, isValidEmail: true);
      debugPrint("*******this is the validation email ${loggingUser.isValidEmail}");
      emit(const LoginScreenEmailState(
        messages: emptyString,
      ));
    } else if (event.email.isEmpty || !event.email.contains("@yahoo.com") || !event.email.contains("@gmail.com")) {
      loggingUser = loggingUser.copyWith(isValidEmail: false);
      emit(
        const LoginScreenEmailState(
          messages: "please Enter a valid email",
        ),
      );
    }
  }
  void handlePasswordField(LoginUserTypedPasswordEvent event, Emitter<LoginScreenState> emit, User loggingUser) {
    emit(const LoginScreenPasswordState(
      messages: '',
    ));
    if (event.password.length < 8) {
      emit(
        const LoginScreenPasswordState(
          messages: "your password is less than 8 digits",
        ),
      );
    } else if (event.password.length >= 8) {
      loggingUser = loggingUser.copyWith(password: event.password);
      emit(const LoginScreenPasswordState(
        messages: emptyString,
      ));
    }
  }
  handleBtnClickedEvent(LoginBtnClickedEvent event, Emitter<LoginScreenState> emit, User loggingUser, LoginWithEmailUseCase loginWithEmailUseCase) async{
    loggingUser = loggingUser.copyWith(email: event.email, password: event.password);
    emit(const LoginLoadingState(messages: ''));
    (await loginWithEmailUseCase.call(loggingUser)).fold(
          (l) => emit(const LoginFailedState(messages: '')),
          (r) => emit(const LoginSuccessState(messages: '')),
    );

  }
  handleGoogleBtnClickedEvent(GoogleBtnClickedEvent event, Emitter<LoginScreenState> emit, User loggingUser, LoginWithEmailUseCase loginWithEmailUseCase) async{
    debugPrint("i have been clicked as a google sign in ");
    loggingUser = loggingUser.copyWith();
    emit(const LoginLoadingState(messages: ''));



    (await loginWithGoogleUseCase.call()).fold(
          (l) => emit(const LoginFailedState(messages: '')),
          (r) => emit(const LoginSuccessState(messages: '')),
    );



  }


}
