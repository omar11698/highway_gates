import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/forgotpassword_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/login_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/onBoarding_screen/onBoarding_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/animation_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/splash_screen.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/verification_screen.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/pages/payment_screen.dart';
import 'package:highway_gates/main.dart';

import '../../Authentication_feature/presentation/pages/auth_screen.dart';
import '../../Authentication_feature/presentation/pages/signup_screen.dart';
import '../../Traffic_Contraventions_feature/presentation/pages/balance_screen.dart';
import '../../Traffic_Contraventions_feature/presentation/pages/billing_screen.dart';
import '../../Traffic_Contraventions_feature/presentation/pages/vechile_id_screen.dart';
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
const String authRoute='/authenticationRoute';
const String googleAuthRoute='/googleAuthRoute';
///
/// traffic contraventions feature routes

const String vehicleIdRoute='/vehicleIdRoute';
const String billingRoute='/billingRoute';
const String paymentRoute='/paymentRoute';
const String balanceRoute='/balanceRoute';





class NavigationRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case homeRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case animationRoute :
        return MaterialPageRoute(builder: (_) => const AnimationScreen());
      case onBoardingRoute :
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case loginRoute :
        initLoginWithGoogleModule();
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUpRoute :
        initSignUpModule();
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case forgotPasswordRoute :
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case verificationRoute :
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case authRoute :
        initLoginModule();
        initLoginWithGoogleModule();
        initSignOutModule();
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());

      case googleAuthRoute :
        initLoginModule();
        initLoginWithGoogleModule();
        initSignOutModule();
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());


      /// Traffic Contraventions Routes
    ///
    ///
      case vehicleIdRoute:
        return MaterialPageRoute(builder: (_) => const VehicleIdScreen());
      case billingRoute:
        return MaterialPageRoute(builder: (_) => const BillingScreen());
      case paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case balanceRoute:
        return MaterialPageRoute(builder: (_) => const BalanceScreen(balance: "0.0 ",));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}