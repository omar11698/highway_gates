import 'package:flutter/material.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/default_button.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/login_textformfield.dart';
import 'package:highway_gates/Core/constants/colors.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import '../../../Core/constants/png_images.dart';
import '../../../Core/constants/strings.dart';
import '../widgets/google_facebook_card.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var mobileSize = MediaQuery.of(context).size;
    var spaceBetweenWidgets=SizedBox(height:mobileSize.height*0.02 ,);
    TextEditingController nameTextEditingController=TextEditingController();
    TextEditingController emailTextEditingController=TextEditingController();
    TextEditingController passwordsTextEditingController=TextEditingController();
    TextEditingController verifyPasswordEditingController=TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: ()=>Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(strCreateNewAcc,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
              spaceBetweenWidgets,
              const Align(alignment: Alignment.center,child: Text(strSetupYourAccount,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.grey),)),

           /// content dialog
           content(nameTextEditingController, spaceBetweenWidgets, emailTextEditingController, passwordsTextEditingController, verifyPasswordEditingController),
            spaceBetweenWidgets,
            spaceBetweenWidgets,

            /// sign up button
            DefaultButton(mobileSize: mobileSize, label: "Sign Up"),
            spaceBetweenWidgets,

            alreadyHaveAccount(mobileSize, context),
            spaceBetweenWidgets,
            spaceBetweenWidgets,
            orRow(),
           spaceBetweenWidgets,
           googleAndFacebookAuth(mobileSize),


            ],
          ),
        ));
  }

  Padding content(TextEditingController nameTextEditingController, SizedBox spaceBetweenWidgets, TextEditingController emailTextEditingController, TextEditingController passwordsTextEditingController, TextEditingController verifyPasswordEditingController) {
    return Padding(
           padding: const EdgeInsets.only(left: 15.0,top: 10,right: 15),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
             LoginTextField(icon: Icons.person_outline_outlined, labelMessage: "Name", controller: nameTextEditingController),
             spaceBetweenWidgets,
             LoginTextField(icon: Icons.email_outlined, labelMessage: "E-mail", controller: emailTextEditingController),
             spaceBetweenWidgets,
             LoginTextField(icon: Icons.lock_open_outlined, labelMessage: "Password", controller: passwordsTextEditingController),
             spaceBetweenWidgets,
             LoginTextField(icon: Icons.lock_open_outlined, labelMessage: "Verify Password", controller: verifyPasswordEditingController),


           ],),
         );
  }

  SizedBox alreadyHaveAccount(Size mobileSize, BuildContext context) {
    return SizedBox(
            width: mobileSize.width * 0.6,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(strAlreadyHaveAccount,style: TextStyle(fontSize: mobileSize.width>768?16:12),),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, loginRoute),
                    child:  Text(
                      " Log In",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: mobileSize.width>768?16:12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
  Padding orRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 110,
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
  Padding googleAndFacebookAuth(Size mobileSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GoogleFacebookCard(cardName: "Google",icon: googlePngImg, onTap: () {},),
          SizedBox(
            width: mobileSize.height * 0.03,
          ),
          GoogleFacebookCard(cardName: "Facebook",icon: facebookPngImg, onTap: () {},),

        ],
      ),
    );
  }


}


