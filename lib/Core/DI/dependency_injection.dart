import 'package:get_it/get_it.dart';
import 'package:highway_gates/Authentication_feature/data/data_sources/firebase/firebase_auth.dart';
import 'package:highway_gates/Authentication_feature/data/repositories/AuthRepository_imp.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/create_user_usecase.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/login_with_email_usecase.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/login_with_facebook_usecase.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/login_with_google_usecase.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/signout_usecase.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/login_screen_bloc/login_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> intiAppModule()async{
  // shared preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(
          () =>prefs);
// remote data source
  instance.registerLazySingleton<FirebaseAuthentication>(
          () =>FirebaseAuthImpl());
// repository
instance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(firebaseAuth: instance()));
}

initSignUpModule() {
  if (!GetIt.I.isRegistered<CreateUserUseCase>()) {
    instance
        .registerFactory<CreateUserUseCase>(() => CreateUserUseCase(authRepository: instance()));
    instance
        .registerFactory<SignupScreenBloc>(() => SignupScreenBloc(instance()));
  }
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginWithEmailUseCase>()) {
    instance
        .registerFactory<LoginWithEmailUseCase>(() => LoginWithEmailUseCase(authRepository: instance()));
    instance
        .registerFactory<LoginScreenBloc>(() => LoginScreenBloc(loginWithEmailUseCase:instance(), loginWithGoogleUseCase: instance(), loginWithFaceBookUseCase: instance()));

  }
}
initLoginWithGoogleModule(){
  if (!GetIt.I.isRegistered<LoginWithGoogleUseCase>()) {
    instance
        .registerFactory<LoginWithGoogleUseCase>(() => LoginWithGoogleUseCase(authRepository: instance()));
  }
}
initLoginWithFacebookModule(){
  if (!GetIt.I.isRegistered<LoginWithFaceBookUseCase>()) {
    instance
        .registerFactory<LoginWithFaceBookUseCase>(() => LoginWithFaceBookUseCase(authRepository: instance()));
  }
}

initSignOutModule(){
  if (!GetIt.I.isRegistered<SignOutUseCase>()) {
    instance
        .registerFactory<SignOutUseCase>(() => SignOutUseCase(authRepository: instance()));
  }
}