import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:highway_gates/Authentication_feature/data/models/user_model.dart';

abstract class FirebaseAuth {
   Future<Unit> createUser(
      {
    required String name,
    required String email,
    required String password,
    String? messages,
    String? id,
    String? phone,
    String? image,
    String? token,
    String? creditCardNumber,
  }
  ) ;
  Future<Unit> signInWithEmail(String email, String password);
  Future<Unit> signInWithGoogle();
  Future<Unit> signInWithFacebook();
  Future<Unit> signOut(String token);
}

class FirebaseAuthImpl extends FirebaseAuth {
  @override
  Future<Unit> createUser({
    required String name,
    required String email,
    required String password,
    String? messages,
    String? id,
    String? phone,
    String? image,
    String? token,
    String? creditCardNumber,
    bool? isValidPassword,
    bool? isValidEmail,
  }) async {
    final UserModel userModel = UserModel(
      name: name,
      email: email,
      id: id,
      token: token,
      phone: phone,
      image: image,
      creditCardNumber: creditCardNumber,
      messages: messages,
      password: password, isValidPassword: isValidPassword, isValidEmail: isValidEmail,
    );
    // await FirebaseFirestore.instance.collection('users').doc(id).set(userModel.toJson());
    await FirebaseFirestore.instance.collection('users').add(userModel.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    return Future.value(unit);
  }

  @override
  Future<Unit> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Unit> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Unit> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Unit> signOut(String token) {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
