import 'package:dartz/dartz.dart';

import '../../../Core/Failures/failures.dart';
import '../repositories/auth_repository.dart';

class LoginWithFaceBookUseCase {


  final AuthRepository authRepository;
  LoginWithFaceBookUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call ()async{
    return await authRepository.signInWithFacebook();

  }
}