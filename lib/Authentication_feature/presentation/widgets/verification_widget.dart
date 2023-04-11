import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Core/constants/colors.dart';

class VerificationField extends StatelessWidget {
  const VerificationField({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: ColorPalette.grey,),),
      child: TextField(
        onChanged: (value){
          if(value.length==1){
            FocusScope.of(context).nextFocus();
          }
          else if(value.isEmpty){
            FocusScope.of(context).previousFocus();
          }
        },

        keyboardType: TextInputType.number,
        decoration: const InputDecoration(border: InputBorder.none),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],

      ),
    );
  }
}
