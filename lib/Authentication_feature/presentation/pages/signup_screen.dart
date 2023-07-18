import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/default_button.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/login_textformfield.dart';
import 'package:highway_gates/Core/constants/colors.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import '../../../Core/DI/dependency_injection.dart';
import '../../../Core/constants/png_images.dart';
import '../../../Core/constants/strings.dart';
import '../widgets/google_facebook_card.dart';
String snackMessage = "";

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mobileSize = MediaQuery
        .of(context)
        .size;
    var spaceBetweenWidgets = SizedBox(height: mobileSize.height * 0.02,);
    TextEditingController nameTextEditingController = TextEditingController();
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordsTextEditingController = TextEditingController();
    TextEditingController verifyPasswordEditingController = TextEditingController();

    return SafeArea(
      child: BlocProvider(
        create: (context) => SignupScreenBloc(instance()),
        child: Scaffold(

            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(strCreateNewAcc, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                    spaceBetweenWidgets,
                    const Align(alignment: Alignment.center, child: Text(strSetupYourAccount, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),)),

                    /// content dialog
                    content(nameTextEditingController, spaceBetweenWidgets, emailTextEditingController, passwordsTextEditingController, verifyPasswordEditingController),
                    spaceBetweenWidgets,
                    spaceBetweenWidgets,

                    /// sign up button
                    BlocConsumer<SignupScreenBloc, SignupScreenState>(
                      listener: (context, state) {
                        if (state is SignedUpScreenSuccessfullySignedUpState){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message, style: const TextStyle(color: Colors.white),),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          ));
                        }
                        else if(state is FailedSignupScreenState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message, style: const TextStyle(color: Colors.white),),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          ));

                        }
                        else if(state is FailedSignupScreenState) {
                          snackMessage=state.message;
                          debugPrint("this is the message $snackMessage");

                        }                      },
                      builder: (context, state) {
                        return DefaultButton(mobileSize: mobileSize, label: "Sign Up", onTap: () {
                          BlocProvider.of<SignupScreenBloc>(context).add(UserSignUpBtnClickedEvent());


                        },);
                      },
                    ),
                    spaceBetweenWidgets,
                    alreadyHaveAccount(mobileSize, context),
                    spaceBetweenWidgets,
                    spaceBetweenWidgets,
                    orRow(mobileSize),
                    spaceBetweenWidgets,
                    googleAndFacebookAuth(mobileSize),


                  ],
                ),
              ),
            )
        ),
      ),);
  }


  Padding content(TextEditingController nameTextEditingController, SizedBox spaceBetweenWidgets, TextEditingController emailTextEditingController, TextEditingController passwordsTextEditingController,
      TextEditingController verifyPasswordEditingController) {
    String nameMessage = "";
    String emailMessage = "";
    String passwordMessage = "";
    String verifyMessage = "";

    return Padding(
      padding: const EdgeInsets.only(top: 10,),
      child: BlocConsumer<SignupScreenBloc, SignupScreenState>(
        listener: (context, state) {
          if (state is SignupScreenCheckingEmailState) {
            emailMessage = state.messages;
            debugPrint("++++++++++++++++++++++++++++++++++I AM THE MESSAGE:$emailMessage");
          }
          else if (state is SignupScreenCheckedEmailState) {
            emailMessage = state.messages;
          }
          else if (state is SignupScreenCheckingPasswordState) {
            passwordMessage = state.messages;
          }
          else if (state is SignupScreenCheckedPasswordState) {
            passwordMessage = state.messages;
          }

          else if (state is SignupScreenCheckingNameState) {
            nameMessage = state.messages;
          }
          else if (state is SignupScreenVerifyingPasswordState) {
            verifyMessage = state.messages;
          }
          else {

          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              LoginTextField(icon: Icons.person_outline_outlined, labelMessage: "Name", controller: nameTextEditingController, stateMessage: nameMessage,isLoginScreen: false,),
              spaceBetweenWidgets,
              LoginTextField(icon: Icons.email_outlined, labelMessage: "E-mail", controller: emailTextEditingController, stateMessage: emailMessage,isLoginScreen: false,),
              spaceBetweenWidgets,
              LoginTextField(icon: Icons.lock_open_outlined, labelMessage: "Password", controller: passwordsTextEditingController, stateMessage: passwordMessage,isLoginScreen: false,),
              spaceBetweenWidgets,
              LoginTextField(icon: Icons.lock_open_outlined, labelMessage: "Verify Password", controller: verifyPasswordEditingController, stateMessage: verifyMessage,isLoginScreen: false,),

            ],);
        },
      ),
    );
  }

  SizedBox alreadyHaveAccount(Size mobileSize, BuildContext context) {
    return SizedBox(
      width: mobileSize.width * 0.6,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(strAlreadyHaveAccount, style: TextStyle(fontSize: mobileSize.width > 768 ? 16 : 12),),
            InkWell(
              onTap: () => Navigator.pushNamed(context, loginRoute),
              child: Text(
                " Log In",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: mobileSize.width > 768 ? 16 : 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding orRow(Size mobileSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: mobileSize.width >= 360 ? 100 : 0,
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
                width: mobileSize.width >= 360 ? 100 : 0,
                child: Divider(
                  color: ColorPalette.grey,
                  thickness: 1,
                )),
          ],
        ),
      ),
    );
  }

  Padding googleAndFacebookAuth(Size mobileSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GoogleFacebookCard(cardName: "Google", icon: googlePngImg, onTap: () {},),
          SizedBox(
            width: mobileSize.height * 0.03,
          ),
          GoogleFacebookCard(cardName: "Facebook", icon: facebookPngImg, onTap: () {},),

        ],
      ),
    );
  }


}


