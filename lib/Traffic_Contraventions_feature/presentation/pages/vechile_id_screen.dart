import 'package:flutter/material.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/default_button.dart';
import 'package:highway_gates/Core/constants/strings.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';

class VehicleIdScreen extends StatelessWidget {
  const VehicleIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mobileSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              strVehicleId,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            const RaqamLohetElMarkaba(),
            const SizedBox(
              height: 40,
            ),
            DefaultButton(
                mobileSize: mobileSize, label: "استعلام", onTap: () {
                  Navigator.pushNamed(context, billingRoute);
            }),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
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

class RaqamLohetElMarkaba extends StatelessWidget {
  const RaqamLohetElMarkaba({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      height: 50,
      child: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            // enabledBorder: InputBorder.none,
            hintText: strVehicleIdPlate,

          ),

          style: TextStyle(
            fontSize: 30,
            decoration: TextDecoration.none,
            decorationColor: Colors.transparent,


          ),
          textDirection: TextDirection.rtl,
          autofocus: true,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
