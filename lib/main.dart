import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import 'package:highway_gates/Core/MultiBlocProvidersList/MultiBlocProvidersList.dart';
import 'package:highway_gates/Core/constants/text_styles.dart';
import 'package:highway_gates/Core/firebase_options.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/manager/vehicle_id_bloc/vehicle_id_bloc.dart';
import 'Authentication_feature/presentation/manager/first_screen_bloc/first_screen_bloc.dart';
import 'Authentication_feature/presentation/manager/login_screen_bloc/login_screen_bloc.dart';
import 'Core/DI/dependency_injection.dart';
import 'Core/bloc_observer.dart';
import 'Core/router/navigation_router.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {

  /// fire base binding
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await intiAppModule();
  Bloc.observer = MyGlobalObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocProvidersList.blocProvidersList(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRouter.generateRoute,
        initialRoute: vehicleIdRoute,
        title: 'Highway Gates',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

      ),
    );
  }
}

