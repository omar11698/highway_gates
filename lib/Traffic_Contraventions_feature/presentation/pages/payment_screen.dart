import 'package:flutter/material.dart';

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
