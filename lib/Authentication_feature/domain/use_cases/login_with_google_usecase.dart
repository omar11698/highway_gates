import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';
import 'package:highway_gates/Core/Failures/failures.dart';

class LoginWithGoogleUseCase{

  final AuthRepository authRepository;
  LoginWithGoogleUseCase({required this.authRepository});

  Future<Either<Failure,Future<GoogleSignInAccount>?>> call ()async{
    return await authRepository.signInWithGoogle();

  }
}