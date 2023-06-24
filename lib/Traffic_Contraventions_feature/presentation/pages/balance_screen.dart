import 'package:flutter/material.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/default_button.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';

class BalanceScreen extends StatelessWidget {
  final String balance;
  const BalanceScreen({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    var mobileSize=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: double.infinity,),
            Text("الرصيد المتاح ",textDirection: TextDirection.rtl,style: buildTextStyle(),),
            SizedBox(height:mobileSize.height/5 ,),
             Center(
              child: Text('$balance ',style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height:mobileSize.height/6 ,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: DefaultButton(mobileSize: mobileSize, label: "إعادة الشحن ", onTap: (){
                Navigator.of(context).pushNamed(paymentRoute);
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 20),
              child: DefaultButton(mobileSize: mobileSize, label: "دفع الغرامة ", onTap: (){
                Navigator.of(context).pushReplacementNamed(billingRoute);
              }),
            ),


          ],
        ),
      ),
    );

  }
  TextStyle buildTextStyle() =>
      const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 40);
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(billingRoute);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
        backgroundColor: Colors.white);
  }
}
