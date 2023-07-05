import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highway_gates/Authentication_feature/data/data_sources/firebase/firebase_auth.dart';
import 'package:highway_gates/Authentication_feature/domain/repositories/auth_repository.dart';
import 'package:highway_gates/Core/Failures/failures.dart';
import '../../../Core/constants/strings.dart';

typedef Future<Unit> CreateOrSignInOrSignOut();


class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthentication firebaseAuth;

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
  Future<Either<Failure, Unit>> signInWithEmail(String email, String password) async{
    return await _getMessage(() async => await firebaseAuth.signInWithEmail(email, password));
  }

  @override
  Future<Either<Failure, Unit>> signInWithFacebook() async {
    // TODO: implement signInWithFacebook
    return await _getMessage(() async => await firebaseAuth.signInWithFacebook());
  }

  @override
  Future< Either<Failure,Future<GoogleSignInAccount>?> > signInWithGoogle() async{
    try {

      return  Right(firebaseAuth.signInWithGoogle());
    } on FirebaseAuthException catch(e){
      return Left(MyFirebaseException(message:e.message??"null message"));
    }
    // return await _getMessage(() async=> await firebaseAuth.signInWithGoogle());
  }

  @override
  Future<Either<Failure, Unit>> signOut() async{
    return await _getMessage(()async => await firebaseAuth.signOut());
  }


  Future<Either<Failure, Unit>> _getMessage(
      CreateOrSignInOrSignOut createOrSignInOrSignOut,
      ) async {
      try {
        await createOrSignInOrSignOut();
        return const Right(unit);
      } on FirebaseAuthException catch(e){
        return Left(MyFirebaseException(message:e.message??"null message"));
      }
    }
  }

