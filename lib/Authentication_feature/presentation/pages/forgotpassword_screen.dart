import 'package:flutter/material.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';

import '../widgets/default_button.dart';
import '../widgets/login_textformfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var mobileSize=MediaQuery.of(context).size;
    var spaceBetweenWidgets=SizedBox(height:mobileSize.height*0.02 ,);
    var  emailTextEditingController=TextEditingController();



    return  Scaffold(
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
              const SizedBox(height: 20,),
              const Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
              spaceBetweenWidgets,
              const Align(alignment: Alignment.center,child: Text("Please enter your email address.So we'll send\n you link to get back to your account. ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.grey),)),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 10,right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    spaceBetweenWidgets,
                    LoginTextField(icon: Icons.email_outlined, labelMessage: "E-mail", controller: emailTextEditingController),



                  ],),
              ),
              spaceBetweenWidgets,
              spaceBetweenWidgets,
              DefaultButton(mobileSize: mobileSize, label: "Send Code",onTap:(){Navigator.of(context).pushReplacementNamed(verificationRoute);} ,),



            ],
          ),
        ));
  }
}
