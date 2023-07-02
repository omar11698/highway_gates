import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/login_screen_bloc/login_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/login_screen_bloc/login_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/animation_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/first_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/login_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/splash_screen.dart';

import '../../../Traffic_Contraventions_feature/presentation/pages/vechile_id_screen.dart';
import '../widgets/default_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  AuthenticationScreenState createState() => AuthenticationScreenState();
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return const VehicleIdScreen();
          }
          else if (snapshot.connectionState== ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return const LoginScreen();
        });
  }
}

class GoogleAuthScreen extends StatelessWidget {
  const GoogleAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
            builder: (context, state) {
          if (state is LoginGoogleAccSuccessState) {
            return FutureBuilder<GoogleSignInAccount>(
              future: state.googleAccount,
              builder: (BuildContext context,
                  AsyncSnapshot<GoogleSignInAccount> snapshot) {
                if (snapshot.hasData) {
                  // return Text(snapshot.data.toString());
                  return const VehicleIdScreen();
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                else if (snapshot.connectionState== ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                else {
                  return const LoginScreen();
                }
              },
            );
          }
          return const LoginScreen();
        }),
      ),
    );
  }
}
