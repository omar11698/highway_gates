import 'package:dartz/dartz.dart';
import 'package:highway_gates/Authentication_feature/domain/entities/user.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';

import '../../../Core/Failures/failures.dart';
import '../../../Core/constants/strings.dart';

class CreateUserUseCase {
  final AuthRepository authRepository;

  CreateUserUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call(User user) async {
    return await authRepository.createUser(
      name: user.name,
      email: user.email,
      password: user.password,
      id: user.id ?? emptyString,
      token: user.token ?? emptyString,
      phone: user.phone ?? emptyString,
      image: user.image ?? emptyString,
      creditCardNumber: user.creditCardNumber ?? emptyString,
      messages:user.messages?? emptyString,

    );
  }
}