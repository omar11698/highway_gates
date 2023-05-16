import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/manager/signup_screen_bloc/signup_screen_bloc.dart';
import 'package:highway_gates/Core/constants/colors.dart';

class LoginTextField extends StatelessWidget {
  final  String labelMessage;
  final IconData icon;
  final TextEditingController controller;
  final String stateMessage;

  const LoginTextField({
    Key? key,
    required this.icon,
    required this.labelMessage,
    required this.controller, required this.stateMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              /// Icon
              SizedBox(
                height: screenSize.height*0.046,
                width: screenSize.height*0.046,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(icon,color: ColorPalette.titleMainBlueColor,),
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              /// size of the Text field

              SizedBox(
                width: screenSize.width * 0.6,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: labelMessage!="E-mail" ? TextInputType.visiblePassword :TextInputType.emailAddress,
                    obscureText: labelMessage.contains("Password") ? true : false,

                    onChanged:(value){

                      if (labelMessage=="E-mail"){

                        /// add event userEntered email
                        BlocProvider.of<SignupScreenBloc>(context).add(UserTypingEmailEvent(email: controller.value.text.toString()));

                      }

                      else if (labelMessage== "Name"){

                        /// add event userEntered Name
                        BlocProvider.of<SignupScreenBloc>(context).add(UserTypingNameEvent(name:controller.value.text.toString()));

                      }

                      else if (labelMessage== "Password"){

                        /// add event userEntered password
                        BlocProvider.of<SignupScreenBloc>(context).add(UserTypingPasswordEvent(password: controller.value.text.toString()));

                      }
                      else if (labelMessage== "Verify Password"){

                        /// add event verifying password
                        BlocProvider.of<SignupScreenBloc>(context).add(UserTypingVerifyPasswordEvent(verifyPassword: controller.value.text.toString(),));

                      }
                      return;

                    } ,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: labelMessage,
                      errorText: stateMessage,
                      errorStyle: TextStyle(height: 0.1,fontSize: 12,color: stateMessage.contains("verified")?Colors.green:Colors.red),
                      errorMaxLines: 1,
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
