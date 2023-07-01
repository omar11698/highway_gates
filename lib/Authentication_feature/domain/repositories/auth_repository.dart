import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../Core/Failures/failures.dart';

/// contract between data and domain layers
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
  Future< Either<Failure, Future<GoogleSignInAccount>?> > signInWithGoogle();
  Future<Either<Failure, Unit>> signInWithFacebook();
  Future<Either<Failure, Unit>> signOut();



}