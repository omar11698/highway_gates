import 'dart:math';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';

import '../../../Core/constants/svg_images.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    var listOfNums=[0,50,250,500,0,0,];
    var randomNumber=listOfNums[Random().nextInt(listOfNums.length)];
    String? elgharama="$randomNumber";
    var mobileSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: mobileSize.height/3,
                width: mobileSize.width*0.5,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SvgPicture.asset(
                    logoSvgImg,
                  ),
                ),),
            ),
            const SpaceBetween(),
            const SpaceBetween(),
            const SpaceBetween(),
            Container(
              height: mobileSize.height/2.2,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color:Color(0xff304D82),width: 2),borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 165,
                          height: 50,
                          child: DateTimePicker(
                            initialValue: '',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Date',
                            icon: const Icon(
                              Icons.calendar_month,
                              size: 30,
                            ),
                            onChanged: (val) => setState(() {

                            }),

                            validator: (val) {
                              print(val);
                              setState(() {

                              });
                              return null;
                            },
                            onSaved: (val) => print(val)),
                          ),
                      const SizedBox(
                        width: 100,
                      ),
                      Text(
                        'التاريخ ',
                        style: buildTextStyle(),
                      ),
                    ],
                  ),
                  const SpaceBetween(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(child: SizedBox(width: 10,)),
                        Text(
                          '$elgharama ',
                          style: buildTextStyle(),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          'الغرامة ',
                          style: buildTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SpaceBetween(),
                  InkWell(
                    onTap: (){Navigator.of(context).pushNamed(balanceRoute);},
                    child: Text(
                      'الرصيد المتاح ',
                      style: buildTextStyle(),
                    ),
                  ),
                  const SpaceBetween(),
                  InkWell(
                    onTap: (){Navigator.of(context).pushNamed(paymentRoute);},

                    child: Text(
                      'تجديد الشحن ',
                      style: buildTextStyle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle buildTextStyle() =>
      const TextStyle(color: Color(0xff3172DC), fontWeight: FontWeight.w500, fontSize: 26);

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

class SpaceBetween extends StatelessWidget {
  const SpaceBetween({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}
