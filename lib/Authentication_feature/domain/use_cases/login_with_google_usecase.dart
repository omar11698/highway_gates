import 'package:dartz/dartz.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';
import 'package:highway_gates/Core/Failures/failures.dart';

class LoginWithGoogleUseCase{

  final AuthRepository authRepository;
  LoginWithGoogleUseCase({required this.authRepository});

  Future<Either<Failure,Unit>> call ()async{
    return await authRepository.signInWithGoogle();

  }
}