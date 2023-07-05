import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/manager/balance_bloc/balance_bloc.dart';

import '../../Authentication_feature/presentation/manager/first_screen_bloc/first_screen_bloc.dart';
import '../../Authentication_feature/presentation/manager/login_screen_bloc/login_screen_bloc.dart';
import '../../Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import '../../Traffic_Contraventions_feature/presentation/manager/vehicle_id_bloc/vehicle_id_bloc.dart';
import '../DI/dependency_injection.dart';

class MultiBlocProvidersList{

  static  blocProvidersList(BuildContext context){

   return  [
      BlocProvider<SignupScreenBloc>(
        create: (context) => SignupScreenBloc(instance()),
      ),
      BlocProvider(
        create: (context) => LoginScreenBloc(loginWithEmailUseCase: instance(), loginWithGoogleUseCase: instance(), loginWithFaceBookUseCase: instance()),
      ),
      BlocProvider(
        create: (context) => FirstScreenBloc(signOutUseCase: instance()),
      ),
      BlocProvider(
        create: (context) => VehicleIdBloc(),
      ),
     BlocProvider(
        create: (context) => BalanceBloc(),
      ),
    ];

  }
}