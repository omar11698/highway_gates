import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highway_gates/Core/constants/svg_images.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mobileSize=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: _buildAppBar(context),
      body:
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
                    const SizedBox(width: double.infinity,),
                    Container(
                      margin: EdgeInsets.only(left:25,right: 25,top: 50),
                      height: mobileSize.height/4,
                      width: mobileSize.width*0.9,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: SvgPicture.asset(
                          paymentSvgImg,
                        ),
                      ),),








          ],
      ),
       ),
    );
  }
  TextStyle buildTextStyle() =>
      const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30);
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
        backgroundColor: Colors.white);
  }

}
