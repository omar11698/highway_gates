import 'dart:math';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/manager/balance_bloc/balance_bloc.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/manager/vehicle_id_bloc/vehicle_id_bloc.dart';

import '../../../Authentication_feature/presentation/widgets/default_button.dart';
import '../../../Core/constants/strings.dart';
import '../../../Core/constants/svg_images.dart';

class BillingScreen extends StatefulWidget {
  final gharama;
  const BillingScreen({super.key, this.gharama});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  // bool   isBeforePickDate=true;
  var ghrama = 400;
  var avBalance =0;
  var oldBalance=0;


  @override
  Widget build(BuildContext context) {
    ghrama=int.parse(widget.gharama)??400;
    //
    // var listOfNums=[0,50,250,500,0,];
    // var randomNumber=listOfNums[Random().nextInt(listOfNums.length)];
    // String? elgharama=isBeforePickDate?"0":"$randomNumber";
    var mobileSize = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: buildSingleChildScrollView(mobileSize, context),

    );
  }

  SingleChildScrollView buildSingleChildScrollView(Size mobileSize, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),

            buildLogoSvgImg(mobileSize),

            const SpaceBetween(),
            const SpaceBetween(),
            const SpaceBetween(),

            buildBillingContent(mobileSize, context)

          ],
        ),
      ),
    );
  }

  Container buildBillingContent(Size mobileSize, BuildContext context) {
    return Container(
            height: mobileSize.height / 1.9,
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
                              Expanded(
                                child: Text(
                                  state.nationalId,
                                  style: buildTextStyle(),
                                ),
                              ),
                              // const Expanded(
                              //   child: SizedBox(
                              //     width: 100,
                              //   ),
                              // ),
                              Text(
                                'الرقم القومي',
                                style: buildTextStyle(),
                              ),
                            ],
                          ),
                          const SpaceBetween(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                state.vehicleId,
                                style: const TextStyle(
                                    color: Color(0xff3172DC),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Text(
                                'رقم اللوحة',
                                style: buildTextStyle(),
                              ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      BlocBuilder<BalanceBloc, BalanceState>(
                      builder: (context, state) {
                        if(state is PayWithBalanceSuccess){
                          return Text(
                            // '$elgharama ',
                            "${state.ghrama??ghrama}",
                            style: buildTextStyle(),
                          );
                        }
                        return Text(
                        // '$elgharama ',
                        "$ghrama",
                        style: buildTextStyle(),
                      );
  },
),
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        strContravention,
                        style: buildTextStyle(),
                      ),
                    ],
                  ),
                ),
                const SpaceBetween(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed(paymentRoute);
                    //   },
                    //   child: const Text(
                    //     strCheckOut,
                    //     style: TextStyle(
                    //         // Color(0xff3172DC)
                    //         color: Color(0xff3172DC),
                    //
                    //         fontWeight: FontWeight.w300,
                    //         fontSize: 18,
                    //     ),
                    //   ),
                    // ),
                    const Expanded(
                        child: SizedBox(
                      width: 85,
                    )),
                    BlocBuilder<BalanceBloc, BalanceState>(
                      builder: (context, state) {
                        if (state is BalanceCalculationSuccess) {
                          avBalance = int.parse(state.balance);
                          return Text(
                            "$avBalance",
                            style: buildTextStyle(),
                          );
                        }
                        else if (state is PayWithBalanceSuccess) {
                          avBalance = int.parse(state.balance);
                          return Text(
                            "$avBalance",
                            style: buildTextStyle(),
                          );
                        }
                        return Text(
                          "0",
                          style: buildTextStyle(),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pushNamed(balanceRoute);
                      },
                      child: Text(
                        strAvailableBalance,
                        style: buildTextStyle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      context.read<BalanceBloc>().add(AddCurrentBalanceAndPayWithBalanceEvent(balance:avBalance.toString()));
                      Navigator.of(context).pushNamed(paymentRoute);
                    },
                    child: const Text(
                      strCheckOut,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        // Color(0xff3172DC)
                        color: Color(0xff3172DC),

                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120.0, vertical: 25),
                    child: DefaultButton(
                        mobileSize: mobileSize,
                        label: "دفع الغرامة",
                        onTap: () {
                          if (avBalance == 0||avBalance<ghrama) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Failed'),
                                  icon:
                                      const Icon(Icons.sms_failed_rounded),
                                  content:
                                      const Text('الرجاء إعادة الشحن!'),
                                  actions: [
                                    DefaultButton(
                                      mobileSize: mobileSize,
                                      label: 'Ok',
                                      onTap: () {

                                        Navigator.of(context).pop();
                                        // var calculatedBalance=avBalance-ghrama;
                                        // if(calculatedBalance>=0) {
                                        //   context.read<BalanceBloc>().add(
                                        //       PayWithBalanceEvent(
                                        //         balance: calculatedBalance
                                        //             .toString(),));
                                        // }
                                        // ghrama=0;
                                        // setState(() {
                                        //
                                        // });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (avBalance != 0 && ghrama != 0&&avBalance>=ghrama) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Success'),
                                  icon: const Icon(Icons.done_outline),
                                  content: const Text(
                                      'Your operation was successful.'),
                                  actions: [
                                    DefaultButton(
                                      mobileSize: mobileSize,
                                      label: 'Ok',
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        var calculatedBalance =
                                            avBalance - ghrama;
                                        print("xxxxxxxxxxxxxxxx$avBalance this is the ghrama :$ghrama ");
                                        if (calculatedBalance >= 0) {
                                          context
                                              .read<BalanceBloc>()
                                              .add(PayWithBalanceEvent(
                                                balance: calculatedBalance
                                                    .toString(),
                                            newGharama: "0",
                                              ));context
                                              .read<BalanceBloc>()
                                              .add(PayButtonClicked(
                                                balance: calculatedBalance,
                                            ghrama: ghrama,
                                              ));
                                        }
                                        // ghrama = 0;
                                        // setState(() {});
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (ghrama == 0) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('!لا توجد غرامة'),
                                  icon: const Icon(
                                      Icons.notification_important_rounded),
                                  content: const Text('للرجوع اضغط الزر'),
                                  contentPadding: const EdgeInsets.only(
                                      left: 100, top: 20, bottom: 20),
                                  actions: [
                                    DefaultButton(
                                      mobileSize: mobileSize,
                                      label: 'Ok',
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        var calculatedBalance =
                                            avBalance - ghrama;
                                        if (calculatedBalance >= 0) {
                                          context
                                              .read<BalanceBloc>()
                                              .add(PayWithBalanceEvent(
                                                balance: calculatedBalance
                                                    .toString(),
                                            newGharama: "0"
                                              ));
                                        }
                                        ghrama = 0;
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          // Navigator.of(context).pushReplacementNamed(billingRoute);
                        }),
                  ),
                ),
              ],
            ),
          );
  }

  Align buildLogoSvgImg(Size mobileSize) {
    return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: mobileSize.height / 4,
              width: mobileSize.width * 0.4,
              child: FittedBox(
                fit: BoxFit.fill,
                child: SvgPicture.asset(
                  logoSvgImg,
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
              Navigator.pop(context);
              // Navigator.of(context).pushReplacementNamed(vehicleIdRoute);
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
      height: 15,
    );
  }
}
