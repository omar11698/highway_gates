import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/forgotpassword_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/login_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/onBoarding_screen/onBoarding_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/animation_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/splash_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/verification_screen.dart';
import 'package:highway_gates/main.dart';

import '../../Authentication_feature/presentation/pages/signup_screen.dart';
import '../DI/dependency_injection.dart';

const String homeRoute='/';
const String splashRoute='/splash';
const String animationRoute='/animation';
const String onBoardingRoute='/onBoard';
const String loginRoute='/login';
const String signUpRoute='/signup';
const String registerRoute='/register';
const String forgotPasswordRoute='/forgotPassword';
const String verificationRoute='/verificationRoute';



class NavigationRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: "Highway Gates"));
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case animationRoute :
        return MaterialPageRoute(builder: (_) => const AnimationScreen());
      case onBoardingRoute :
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case loginRoute :
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUpRoute :
        initSignUpModule();
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case forgotPasswordRoute :
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case verificationRoute :
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}