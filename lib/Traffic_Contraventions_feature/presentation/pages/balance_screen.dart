import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

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
            Text("الرصيد المتاح ",textDirection: TextDirection.rtl,style: buildTextStyle(),),
            SizedBox(height:mobileSize.height/4 ,),
            const Center(
              child: Text('0.0',style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height:mobileSize.height/6 ,),

            Center(child: ElevatedButton(onPressed: (){}, child: const Text("إعادة الشحن "),)),



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
