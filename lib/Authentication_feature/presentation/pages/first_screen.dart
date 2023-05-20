import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/DI/dependency_injection.dart';
import '../manager/first_screen_bloc/first_screen_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstScreenBloc(signOutUseCase: instance()),
      child: Scaffold(body: Column(
        children: [
          const Center(child: Text("User Logged in Successfully congratulations"),),
          Center(child: OutlinedButton(onPressed: () {
            context.read<FirstScreenBloc>().add(SignOutBtnClickedEvent());
          }, child: const Text("sign Out"))),
        ],
      )),
    );
  }
}
