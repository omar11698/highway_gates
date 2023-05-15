import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/pages/signup_screen.dart';
import 'package:highway_gates/Core/constants/text_styles.dart';
import 'package:highway_gates/Core/firebase_options.dart';
import 'Core/DI/dependency_injection.dart';
import 'Core/bloc_observer.dart';
import 'Core/router/navigation_router.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  /// fire base binding
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await intiAppModule();
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyGlobalObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupScreenBloc>(create: (_) => SignupScreenBloc(instance())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRouter.generateRoute,
        initialRoute: animationRoute,
        title: 'Highway Gates',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: onBoardingTitleTextStyle,
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
