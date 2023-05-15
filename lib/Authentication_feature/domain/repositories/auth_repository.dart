import 'package:dartz/dartz.dart';

import '../../../Core/Failures/failures.dart';

abstract class AuthRepository{
  Future<Either<Failure, Unit>> createUser({
    required String name,
    required String email,
    required String password,
    String? id,
    String? messages,
    String? phone,
    String? image,
    String? token,
    String? creditCardNumber,
  });
  Future<Either<Failure, Unit>> signInWithEmail(String email, String password);
  Future<Either<Failure, Unit>> signInWithGoogle();
  Future<Either<Failure, Unit>> signInWithFacebook();
  Future<Either<Failure, Unit>> signOut(String token);



}