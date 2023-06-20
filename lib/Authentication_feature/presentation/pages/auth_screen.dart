import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/first_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/login_screen.dart';

import '../../../Traffic_Contraventions_feature/presentation/pages/vechile_id_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  AuthenticationScreenState createState() => AuthenticationScreenState();
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() ,builder:(ctx,snapshot){
      if(snapshot.hasData){
        return const VehicleIdScreen();
      }
        return const LoginScreen();
    });
  }
}
