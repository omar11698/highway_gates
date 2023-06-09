import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/login_screen_bloc/login_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/login_textformfield.dart';
import 'package:highway_gates/Core/constants/colors.dart';
import 'package:highway_gates/Core/constants/png_images.dart';
import 'package:highway_gates/Core/constants/strings.dart';
import 'package:highway_gates/Core/constants/svg_images.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import '../../../Core/DI/dependency_injection.dart';
import '../widgets/default_button.dart';
import '../widgets/google_facebook_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String emailMessage = "";
    String passwordMessage = "";
    String errorMessage = "";


    TextEditingController loginTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
    TextEditingController();
    var mobileSize = MediaQuery
        .of(context)
        .size;
    var spaceBetweenWidgets = SizedBox(
      height: mobileSize.height * 0.009,
    );
    var spaceBetweenWidgets2 = SizedBox(
      height: mobileSize.height * 0.03,
    );

    return BlocProvider(
      create: (context) =>
          LoginScreenBloc(
              loginWithEmailUseCase: instance(),
              loginWithGoogleUseCase: instance(), loginWithFaceBookUseCase: instance()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: mobileSize.height * 0.08,
                ),

                /// logo
                logoWidget(mobileSize),
                spaceBetweenWidgets2,

                /// welcome back text

                welcomeBack(),
                spaceBetweenWidgets,

                /// log into accounts text

                loginIntoText(),
                spaceBetweenWidgets,

                ///login and passwords fields
                BlocConsumer<LoginScreenBloc, LoginScreenState>(
                  listener: (context, state) {
                    if (state is LoginScreenEmailState) {
                      emailMessage = state.messages;
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
                      builder: (context, state) {
                        return loginField(
                            loginTextEditingController, emailMessage);
                      },
                    );
                  },
                ),
                spaceBetweenWidgets,
                BlocConsumer<LoginScreenBloc, LoginScreenState>(
                  listener: (context, state) {
                    if (state is LoginScreenPasswordState) {
                      passwordMessage = state.messages;
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
                      builder: (context, state) {
                        return passwordField(passwordTextEditingController,
                            passwordMessage);
                      },
                    );
                  },
                ),
                spaceBetweenWidgets,

                ///forgot password

                forgotPassword(context),
                spaceBetweenWidgets2,

                /// login Button

                BlocConsumer<LoginScreenBloc, LoginScreenState>(
                  listener: (context, state) {
                    errorMessage=state.messages;

                  },
                  builder: (context, state) {
                    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
                      builder: (context, state) {
                        // return loginButton(
                        //   mobileSize,
                        //   context,
                        //   errorMessage,
                        //   loginTextEditingController,
                        //   passwordTextEditingController,
                        // );

                        return DefaultButton(
                          mobileSize: mobileSize,
                          label: 'Log in',
                          onTap: ()  {
                            if(state is LoginFailedState){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:  const Text("Login Failed!",style: TextStyle(fontSize: 16,fontWeight:FontWeight.w500),),
                                    icon: const Icon(Icons.lock),
                                    // contentPadding: EdgeInsets.symmetric(horizontal: 100),
                                    // contentPadding: EdgeInsets.all(5),
                                    content:
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(children: [const Icon(Icons.close_outlined,color: Colors.red,),const SizedBox(width: 10,),Expanded(child: Text(state.messages))],),
                                    ),
                                    actions: [
                                      DefaultButton(
                                        mobileSize: mobileSize,
                                        label: 'Ok',
                                        onTap: () {
                                          Navigator.of(context)
                                              .pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            context.read<LoginScreenBloc>().add(LoginBtnClickedEvent(
                                email: loginTextEditingController.value.text.toString().trim(),
                                password: passwordTextEditingController.value.text.toString().trim()));

                            if(state is LoginSuccessState){
                              // Future.delayed(Duration(seconds: 2));
                              Navigator.pushNamed(context, authRoute);

                            }
                          },
                        );
                      },
                    );
                  },
                ),
                spaceBetweenWidgets2,

                /// first time text

                firstTimeText(mobileSize, context),
                spaceBetweenWidgets2,

                /// Or Row

                orRow(mobileSize),
                spaceBetweenWidgets2,

                /// google and facebook cards
                googleAndFacebookAuth(mobileSize, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text loginIntoText() =>
      const Text(
        strLogIntoText,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w300, color: Colors.grey),
      );

  Text welcomeBack() =>
      const Text(
        strWelcomeBack,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      );

  /// extracted widgets

  Padding googleAndFacebookAuth(Size mobileSize, BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GoogleFacebookCard(
          cardName: strGoogle,
          icon: googlePngImg,
          onTap: () async{
            ctx.read<LoginScreenBloc>().add(GoogleBtnClickedEvent());
              Navigator.pushNamed(ctx, googleAuthRoute);

          },
          ),
          SizedBox(
            width: mobileSize.height * 0.03,
          ),
          GoogleFacebookCard(
            cardName: strFacebook,
            icon: facebookPngImg,
            onTap: () async {
              ctx.read<LoginScreenBloc>().add(FacebookBtnClickedEvent());
              Navigator.pushNamed(ctx, authRoute);

            },
          ),
        ],
      ),
    );
  }

  Padding orRow(Size mobileSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 100,
                child: Divider(
                  color: ColorPalette.grey,
                  thickness: 1,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                strOrSignInWith,
              ),
            ),
            SizedBox(
                width: 100,
                child: Divider(
                  color: ColorPalette.grey,
                  thickness: 1,
                )),
          ],
        ),
      ),
    );
  }

  SizedBox firstTimeText(Size mobileSize, BuildContext context) {
    return SizedBox(
      width: mobileSize.width * 0.4,
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(strFirstTimeHere),
              InkWell(
                onTap: () => Navigator.pushNamed(context, signUpRoute),
                child: const Text(
                  " Sign up",
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DefaultButton loginButton(Size mobileSize,
      BuildContext ctx,
      String message,
      TextEditingController loginTextEditingController,
      TextEditingController passwordTextEditingController) {
    return DefaultButton(
      mobileSize: mobileSize,
      label: 'Log in',
      onTap: () {
        showDialog(
          context: ctx,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              icon: const Icon(Icons.close),
              content:
              Text(message),
              actions: [
                DefaultButton(
                  mobileSize: mobileSize,
                  label: 'Ok',
                  onTap: () {
                    // Navigator.of(context)
                    //     .pop();
                  },
                ),
              ],
            );
          },
        );
        ctx.read<LoginScreenBloc>().add(LoginBtnClickedEvent(
            email: loginTextEditingController.value.text.toString().trim(),
            password: passwordTextEditingController.value.text.toString().trim()));
        Navigator.pushNamed(ctx, authRoute);
      },
    );
  }

  Align forgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, forgotPasswordRoute),
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  LoginTextField passwordField(
      TextEditingController passwordTextEditingController,
      String stateMessage) =>
      LoginTextField(
        // key: GlobalKey<FormState>(),
        icon: Icons.lock_open_outlined,
        labelMessage: "Password",
        controller: passwordTextEditingController,
        stateMessage: stateMessage,
        isLoginScreen: true,
      );

  LoginTextField loginField(TextEditingController loginTextEditingController,
      String stateMessage) =>
      LoginTextField(
        // key: GlobalKey<FormState>(),
        icon: Icons.mail_outline,
        labelMessage: "E-mail",
        controller: loginTextEditingController,
        stateMessage: stateMessage,
        isLoginScreen: true,
      );

  Center logoWidget(Size mobileSize) {
    return Center(
      child: SizedBox(
        height: mobileSize.height * 0.2,
        width: mobileSize.width * 0.3,
        child: FittedBox(fit: BoxFit.fill, child: SvgPicture.asset(logoSvgImg)),
      ),
    );
  }
}
