import 'package:dartz/dartz.dart';

import '../../../Core/Failures/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignOutUseCase{
  final AuthRepository authRepository;
  SignOutUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call() async {
    return await authRepository.signOut();
  }
}