import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highway_gates/Core/constants/colors.dart';

class LoginTextField extends StatelessWidget {
  final  String labelMessage;
  final IconData icon;
  final TextEditingController controller;
  const LoginTextField({
    Key? key,
    required this.icon,
    required this.labelMessage,
    required this.controller,
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
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: controller,
                    keyboardType: labelMessage!="E-mail" ? TextInputType.visiblePassword :TextInputType.emailAddress,
                    obscureText: labelMessage.contains("Password") ? true : false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: labelMessage,
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
