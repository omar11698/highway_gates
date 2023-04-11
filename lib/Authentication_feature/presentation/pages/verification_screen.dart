import 'package:flutter/material.dart';
import '../../../Core/router/navigation_router.dart';
import '../widgets/default_button.dart';
import '../widgets/verification_widget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mobileSize = MediaQuery.of(context).size;
    var spaceBetweenWidgets = SizedBox(
      height: mobileSize.height * 0.02,
    );

    return Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter Verification Code",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              spaceBetweenWidgets,
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "We have sent the code verification\n to your email address.",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    spaceBetweenWidgets,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:   const [
                        VerificationField(),
                        VerificationField(),
                        VerificationField(),
                        VerificationField(),


                      ],
                    )
                  ],
                ),
              ),
              spaceBetweenWidgets,
              spaceBetweenWidgets,
              DefaultButton(
                mobileSize: mobileSize,
                label: "Verify",
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(loginRoute);
                },
              ),
            ],
          ),
        ));
  }
}

