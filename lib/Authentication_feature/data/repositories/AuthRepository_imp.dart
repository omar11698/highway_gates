import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:highway_gates/Authentication_feature/data/data_sources/firebase/firebase_auth.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';
import 'package:highway_gates/Core/Failures/failures.dart';
import '../../../Core/constants/strings.dart';

typedef Future<Unit> CreateOrSignInOrSignOut();


class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({
    required this.firebaseAuth,
  });

  @override
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
  }) async {
    return await _getMessage(() => firebaseAuth.createUser(
      name: name,
      email: email,
      password: password,
      id: id ?? emptyString,
      token: token ?? emptyString,
      phone: phone ?? emptyString,
      image: image ?? emptyString,
      creditCardNumber: creditCardNumber ?? emptyString,
      messages: messages?? emptyString,
    ));
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signOut(String token) {
    // TODO: implement signOut
    throw UnimplementedError();
  }


  Future<Either<Failure, Unit>> _getMessage(
      CreateOrSignInOrSignOut createOrSignInOrSignOut
      ) async {
      try {
        await createOrSignInOrSignOut();
        return const Right(unit);
      } on Failure {
        return Left(MyFirebaseException());
      }
    }
  }

