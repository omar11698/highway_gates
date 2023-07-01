import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/default_button.dart';
import 'package:highway_gates/Core/constants/svg_images.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/manager/balance_bloc/balance_bloc.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/pages/balance_screen.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/pages/billing_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController raseedController = TextEditingController();
    // AutovalidateMode autovalidate = AutovalidateMode.disabled;
    int selectedDay = 14;
    int selectedMonth = 10;
    int selectedYear = DateTime.now().year;
    var mobileSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  height: mobileSize.height / 3.5,
                  width: mobileSize.width,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SvgPicture.asset(
                      paymentSvgImg,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: TextFormField(
                        maxLength: 20,
                        onChanged: (value) {},
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.toString().length < 14) {
                            return "أدخل رقم فيزا صحيح";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Card Number", counterText: ""),
                        keyboardType: TextInputType.number,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: TextFormField(
                      onChanged: (value) {},
                      onSaved: (value) {},
                      validator: (value) {
                        return null;
                      },
                      controller: raseedController,
                      decoration: const InputDecoration(
                        hintText: "Amount of money in Egp",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: const Text(
                        "Expiration Date",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                DropdownDatePicker(
                  locale: "en",
                  inputDecoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      helperText: '',
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))), // optional
                  isDropdownHideUnderline: true, // optional
                  isFormValidator: true, // optional
                  startYear: DateTime.now().year, // optional
                  endYear: 2050, // optional
                  width: 10, // optional
                  showDay: false,
                  selectedDay: selectedDay, // optional
                  selectedMonth: selectedMonth, // optional
                  selectedYear: selectedYear, // optional
                  onChangedDay: (value) {
                    selectedDay = int.parse(value!);
                    print('onChangedDay: $value');
                  },
                  onChangedMonth: (value) {
                    selectedMonth = int.parse(value!);
                    print('onChangedMonth: $value');
                  },
                  onChangedYear: (value) {
                    selectedYear = int.parse(value!);
                    print('onChangedYear: $value');
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: DefaultButton(
                        mobileSize: mobileSize,
                        label: "Proceed",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Success'),
                                  icon: const Icon(Icons.done_outline),
                                  content: const Text(
                                      'Your operation was successful.'),
                                  actions: [
                                    BlocBuilder<BalanceBloc, BalanceState>(
                                      builder: (context, state) {
                                        if(state is BalanceCalculationSuccess){

                                        return DefaultButton(
                                          mobileSize: mobileSize,
                                          label: 'Ok',
                                          onTap: () {
                                            debugPrint(
                                                "**********************${raseedController.text.toString()}");
                                           int newBalance=int.parse(state.balance)+int.parse( raseedController.text
                                               .toString());
                                            context
                                                .read<BalanceBloc>()
                                                .add(PayWithBalanceEvent(
                                                  balance: newBalance.toString(),
                                                ));
                                            Navigator.pushReplacementNamed(
                                                context, billingRoute);

                                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContext){
                                            //   return BalanceScreen(balance: raseedController.text.toString());
                                            // }));
                                            // Navigator.of(context)
                                            //     .pushReplacementNamed(billingRoute,);
                                          },
                                        );
                                        }
                                        return  DefaultButton(
                                          mobileSize: mobileSize,
                                          label: 'Ok',
                                          onTap: () {
                                            debugPrint(
                                                "**********************${raseedController.text.toString()}");

                                            int newBalance=int.parse( raseedController.text
                                                .toString());
                                            context
                                                .read<BalanceBloc>()
                                                .add(PayWithBalanceEvent(
                                              balance: newBalance.toString(),
                                            ));
                                            Navigator.pushReplacementNamed(
                                                context, billingRoute);

                                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext buildContext){
                                            //   return BalanceScreen(balance: raseedController.text.toString());
                                            // }));
                                            // Navigator.of(context)
                                            //     .pushReplacementNamed(billingRoute,);
                                          },
                                        );;
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => const TextStyle(
      color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30);

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

  void onTap(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        "Payment Successful ",
        style: TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
  }
}

class ExpirationDateWidget extends StatefulWidget {
  const ExpirationDateWidget({super.key});

  @override
  State<ExpirationDateWidget> createState() => _ExpirationDateWidgetState();
}

class _ExpirationDateWidgetState extends State<ExpirationDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownDatePicker(
          inputDecoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10))), // optional
          isDropdownHideUnderline: true, // optional
          isFormValidator: true, // optional
          startYear: 1900, // optional
          endYear: 2020, // optional
          width: 10, // optional
          // selectedDay: 14, // optional
          selectedMonth: 10, // optional
          selectedYear: 1993, // optional
          onChangedDay: (value) => print('onChangedDay: $value'),
          onChangedMonth: (value) => print('onChangedMonth: $value'),
          onChangedYear: (value) => print('onChangedYear: $value'),
          //boxDecoration: BoxDecoration(
          // border: Border.all(color: Colors.grey, width: 1.0)), // optional
          // showDay: false,// optional
          // dayFlex: 2,// optional
          // locale: "zh_CN",// optional
          // hintDay: 'Day', // optional
          // hintMonth: 'Month', // optional
          // hintYear: 'Year', // optional
          // hintTextStyle: TextStyle(color: Colors.grey), // optional
        ),
      ],
    );
  }
}
