import 'package:dartz/dartz.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';

import '../../../Core/Failures/failures.dart';
import '../entities/user.dart';

class LoginWithEmailUseCase{
  final AuthRepository authRepository;
  LoginWithEmailUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call(User user) async {
  return await authRepository.signInWithEmail(user.email, user.password);
  }



  }