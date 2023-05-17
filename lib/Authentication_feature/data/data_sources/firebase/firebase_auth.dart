import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highway_gates/Authentication_feature/data/models/user_model.dart';
import 'package:highway_gates/Core/DI/dependency_injection.dart';


abstract class FirebaseAuthentication {
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

class FirebaseAuthImpl extends FirebaseAuthentication {
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
    // await FirebaseFirestore.instance.collection('users').add(userModel.toJson()).then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: userModel.email, password: userModel.password);
    return Future.value(unit);
  }

  @override
  Future<Unit> signInWithEmail(String email, String password) async{
    final UserModel userModel = UserModel(
      email: email,
      password: password, id: '', messages: '', name: '', phone: '', creditCardNumber: '', token: '', image: '', isValidEmail: true, isValidPassword: true,
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: userModel.email, password: userModel.password);


  return Future.value(unit);
  }

  @override
  Future<Unit> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Unit> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential).then((value) => {
     createUser(
     name: value.user!.displayName!,
     email: value.user!.email!,
     id: value.user!.uid,
     token: value.credential!.token as String,
     image: value.user!.photoURL,
     phone: value.user!.phoneNumber, password: '',
     )
     });
  return Future.value(unit);
  }

  @override
  Future<Unit> signOut(String token) {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
