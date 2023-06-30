import 'dart:math';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/manager/vehicle_id_bloc/vehicle_id_bloc.dart';

import '../../../Core/constants/strings.dart';
import '../../../Core/constants/svg_images.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  // bool   isBeforePickDate=true;

  @override
  Widget build(BuildContext context) {
    //
    // var listOfNums=[0,50,250,500,0,];
    // var randomNumber=listOfNums[Random().nextInt(listOfNums.length)];
    // String? elgharama=isBeforePickDate?"0":"$randomNumber";
    var mobileSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
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
                  height: mobileSize.height / 3,
                  width: mobileSize.width * 0.5,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SvgPicture.asset(
                      logoSvgImg,
                    ),
                  ),
                ),
              ),
              const SpaceBetween(),
              const SpaceBetween(),
              const SpaceBetween(),
              Container(
                height: mobileSize.height / 2.2,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff304D82), width: 2),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 30,
                      width: double.infinity,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     // Expanded(
                    //     //   child: SizedBox(
                    //     //       width: 165,
                    //     //       height: 50,
                    //     //       child: DateTimePicker(
                    //     //         initialValue: '',
                    //     //         firstDate: DateTime(2000),
                    //     //         lastDate: DateTime(2100),
                    //     //         dateLabelText: 'Date',
                    //     //         icon: const Icon(
                    //     //           Icons.calendar_month,
                    //     //           size: 30,
                    //     //         ),
                    //     //         onChanged: (val) {
                    //     //           isBeforePickDate=!isBeforePickDate;
                    //     //           setState(() {
                    //     //
                    //     //
                    //     //           });
                    //     //
                    //     //         },
                    //     //
                    //     //
                    //     //
                    //     //         validator: (val) {
                    //     //           print(val);
                    //     //           isBeforePickDate=!isBeforePickDate;
                    //     //           setState(() {
                    //     //
                    //     //           });
                    //     //           return null;
                    //     //         },
                    //     //         onSaved: (val) => print(val)),
                    //     //       ),
                    //     // ),
                    //     const SizedBox(
                    //       width: 100,
                    //     ),
                    //     Text(
                    //       strHistory,
                    //       style: buildTextStyle(),
                    //     ),
                    //   ],
                    // ),
                    BlocBuilder<VehicleIdBloc, VehicleIdState>(
                      builder: (BuildContext context, state) {

                        if (state is VehicleIdSuccess) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(state.vehicleId,style: buildTextStyle(),),
                                  const SizedBox(
                                    width: 12,
                                  ),

                                  Text(
                                    'مرحبا بك يا',
                                    style: buildTextStyle(),
                                  ),
                                ],
                              ),
                              const SpaceBetween(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Text(state.nationalId,style: buildTextStyle(),),
                                  const Expanded(
                                    child: SizedBox(
                                      width: 100,
                                    ),
                                  ),
                                  Text('الرقم القومي',style: buildTextStyle(),),

                                ],
                              ),
                            ],
                          );
                        } else if (state is VehicleIdFailed) {
                          return const Text("somethingwentwrong");
                        } else if (state is VehicleIdInitial) {
                          return const Text('i am the initial state');
                        } else {
                          return const Text("data");
                        }
                      },
                    ),

                    const SpaceBetween(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(
                              child: SizedBox(
                            width: 10,
                          )),
                          Text(
                            // '$elgharama ',
                            '0',
                            style: buildTextStyle(),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(
                            strContravention,
                            style: buildTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    const SpaceBetween(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(balanceRoute);
                      },
                      child: Text(
                        strAvailableBalance,
                        style: buildTextStyle(),
                      ),
                    ),
                    const SpaceBetween(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(paymentRoute);
                      },
                      child: Text(
                        strCheckOut,
                        style: buildTextStyle(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => const TextStyle(
      color: Color(0xff3172DC), fontWeight: FontWeight.w500, fontSize: 26);

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(vehicleIdRoute);
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
