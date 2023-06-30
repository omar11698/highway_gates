import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Authentication_feature/presentation/widgets/default_button.dart';
import 'package:highway_gates/Core/constants/strings.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/manager/vehicle_id_bloc/vehicle_id_bloc.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/pages/billing_screen.dart';

class VehicleIdScreen extends StatefulWidget {
  const VehicleIdScreen({super.key});

  @override
  State<VehicleIdScreen> createState() => _VehicleIdScreenState();
}

class _VehicleIdScreenState extends State<VehicleIdScreen> {
  final _formKey=GlobalKey<FormState>();
  var nationalId="";
  var vehicleId="";

  @override
  Widget build(BuildContext context) {


    var mobileSize = MediaQuery
        .of(context)
        .size;
    var contentHeight=MediaQuery
        .of(context)
        .size.height;
    return BlocProvider(
      create: (context) => VehicleIdBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.manual ,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                // height: mobileSize.height,
                height: contentHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VehicleIdTitle(),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      onTap:(){
                        setState(() {
                          contentHeight=MediaQuery.of(context).size.height -
                              MediaQuery.of(context).viewInsets.bottom;
                        });

                      } ,
                     validator: (value){
                       if(value==null||value.isEmpty||value.trim().isEmpty){
                         return "أدخل رقم المركبة"  ;
                       }
                       return null;
                     },
                      onChanged: (value){
                        _formKey.currentState!.validate();
                        _formKey.currentState!.save();
                      },
                      onSaved: (value){
                        vehicleId=value!;
                      },

                     decoration: const InputDecoration(
                       // border: InputBorder.none,
                       // enabledBorder: InputBorder.none,
                       hintText: strVehicleIdPlate,
                       // label: Text(strVehicleIdPlate),

                     ),

                     style: const TextStyle(
                       fontSize: 30,
                       decoration: TextDecoration.none,
                       decorationColor: Colors.transparent,

                     ),
                     textDirection: TextDirection.rtl,
                     autofocus: true,
                     textAlign: TextAlign.right,
                     ),
                     const SpaceBetween(),
                     const SpaceBetween(),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value){
                          if(value==null||value.isEmpty||value.trim().isEmpty||value.length<14){
                            return "  أدخل الرقم القومي مكون من ١٤ رقم"  ;
                          }
                          return null;
                        },
                        onChanged: (value){
                            _formKey.currentState!.validate();
                            _formKey.currentState!.save();

                        },
                        onSaved: (value){
                          nationalId=value!;

                        }
                        ,

                       decoration: const InputDecoration(
                         // border: InputBorder.none,
                         // enabledBorder: InputBorder.none,
                         hintText: strNationalId,
                       ),

                       style: const TextStyle(
                         fontSize: 30,
                         decoration: TextDecoration.none,
                         decorationColor: Colors.transparent,


                       ),
                       textDirection: TextDirection.rtl,
                       autofocus: true,
                       textAlign: TextAlign.right,
                     ),

                    // const SizedBox(
                    //   height: 40,
                    // ),
                    // const SizedBox(
                    //   height: 100,
                    //   width: 100,
                    //   child: Icon(Icons.camera,size: 40,),
                    // ),
                    //
                    //
                    // const SizedBox(
                    //   height: 40,
                    // ),






                    DefaultButton(
                        mobileSize: mobileSize, label: "استعلام", onTap: () {
                      FocusScope.of(context).unfocus();
                      if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            debugPrint(nationalId);
                            debugPrint(vehicleId);
                            context.read<VehicleIdBloc>().add(VehicleIdSearchEvent(vehicleId: vehicleId,nationalId: nationalId));
                            Navigator.pushNamed(context, billingRoute);
                          }


                    }),
                  ],

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) =>
      AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(loginRoute);
              },
              child: const Icon(
                Icons.exit_to_app_rounded,
                size: 30,
                color: Colors.black,
              )),
          backgroundColor: Colors.white);
}

class VehicleIdTitle extends StatelessWidget {
  const VehicleIdTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      strVehicleId,
      style: TextStyle(
          fontSize: 40,
          color: Colors.blue,
          fontWeight: FontWeight.bold),
    );
  }
}

class RaqamLohetElMarkaba extends StatelessWidget {
  final Widget child;
  
  const RaqamLohetElMarkaba({
    super.key, required this.child,
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
      child:  Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: child,
      ),
    );
  }
}
