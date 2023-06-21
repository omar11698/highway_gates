import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/default_button.dart';
import 'package:highway_gates/Core/constants/svg_images.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    AutovalidateMode autovalidate = AutovalidateMode.disabled;
    int selectedDay = 14;
    int selectedMonth = 10;
    int selectedYear = 1993;
    var mobileSize=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: _buildAppBar(context),
      body:
       SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                      const SizedBox(width: double.infinity,),
                      Container(
                        margin: const EdgeInsets.only(left:25,right: 25,top: 20,),
                        height: mobileSize.height/4,
                        width: mobileSize.width*0.9,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: SvgPicture.asset(
                            paymentSvgImg,
                          ),
                        ),),
              Align(alignment: Alignment.centerLeft,child: Container(margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 1),child: const TextField(decoration: InputDecoration(hintText: "Card Number",),)),),
              Align(alignment: Alignment.centerLeft,child: Container(margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 1),child: const Text("Expiration Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),),

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
                startYear: 1990, // optional
                endYear: 2030, // optional
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
                child: DefaultButton(mobileSize: mobileSize, label: "Proceed", onTap: onTap),
              ),










            ],
      ),
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

  void onTap() {
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
    return  Row(
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

