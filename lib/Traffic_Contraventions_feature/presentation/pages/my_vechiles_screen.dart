import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_gates/Core/router/navigation_router.dart';
import 'package:highway_gates/Traffic_Contraventions_feature/presentation/pages/billing_screen.dart';

import '../../domain/entities/vehicle_entity.dart';
import '../manager/vehicle_id_bloc/vehicle_id_bloc.dart';

class MyVehicles extends StatefulWidget {
  const MyVehicles({super.key});

  @override
  State<MyVehicles> createState() => _MyVehiclesState();
}

class _MyVehiclesState extends State<MyVehicles> {
  List<Vehicle> listOfVehicles=[Vehicle(platteNumber: "first car ", ownerNationalID: "29806110102457", gharama: '200'),Vehicle(platteNumber: "second car", ownerNationalID: "29806110102456", gharama: '600'),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      // floatingActionButton: buildFloatingActionButton(),
      body: CarsListWidget(listOfVehicles: listOfVehicles),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(onPressed: (){
      listOfVehicles.add(Vehicle(platteNumber: "platteNumber", ownerNationalID: "ownerNationalID", gharama: "gharama"));
      setState(() {

      });

      },child: const Icon(CupertinoIcons.plus),);
  }

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      );
}

class CarsListWidget extends StatelessWidget {
  const CarsListWidget({
    super.key,
    required this.listOfVehicles,
  });

  final List<Vehicle> listOfVehicles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfVehicles.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return  ListTile(
          onTap: (){
            context.read<VehicleIdBloc>().add(
                VehicleIdSearchEvent(
                    vehicleId: listOfVehicles[index].platteNumber,
                    nationalId: listOfVehicles[index].ownerNationalID));
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BillingScreen(gharama:listOfVehicles[index].gharama ,)));

            },
          title: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${listOfVehicles[index].platteNumber}",style: TextStyle(fontSize: 26,color: Theme.of(context).primaryColor),),
                  Text("${listOfVehicles[index].ownerNationalID}",style: TextStyle(fontSize: 26),),
                  SizedBox(height: 20,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
