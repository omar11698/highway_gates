import 'package:get_it/get_it.dart';
import 'package:highway_gates/Authentication_feature/data/data_sources/firebase/firebase_auth.dart';
import 'package:highway_gates/Authentication_feature/data/repositories/AuthRepository_imp.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';
import 'package:highway_gates/Authentication_feature/domain/use_cases/create_user_usecase.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';

final instance = GetIt.instance;
Future<void> intiAppModule()async{

// remote data source
  instance.registerLazySingleton<FirebaseAuth>(
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