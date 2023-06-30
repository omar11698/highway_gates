
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'vehicle_id_event.dart';
part 'vehicle_id_state.dart';

class VehicleIdBloc extends Bloc<VehicleIdEvent, VehicleIdState> {
  VehicleIdBloc() : super(VehicleIdInitial()) {
    // on<VehicleIdEvent>((event, emit) {
    //   emit(VehicleIdInitial()) ;   });

    on<VehicleIdSearchEvent>(
        (event, emit) async {
          // if(state is VehicleIdInitial){
          //   emit(VehicleIdSuccess(message: "success",nationalId: event.nationalId,vehicleId: event.vehicleId));
          // }
          // else if (state is VehicleIdSuccess ){
          //   emit(VehicleIdFailed(message: "failed"));
          //
          // }
          print(" The event has been kicked ya omar ");
          if(event.vehicleId.isNotEmpty){
            emit(VehicleIdSuccess(message: "success",nationalId: event.nationalId,vehicleId: event.vehicleId));
          }else{
            emit(VehicleIdFailed(message: "failed"));
          }

          // return handleVehicleIdSearchEvent(event, emit);
        } );
  }

  handleVehicleIdSearchEvent(
      VehicleIdSearchEvent event, Emitter<VehicleIdState> emit) {
      if(event.vehicleId!.isNotEmpty){
        emit(VehicleIdSuccess(message: "success",nationalId: event.nationalId,vehicleId: event.vehicleId));
      }else{
        emit(VehicleIdFailed(message: "failed"));
      }


  }
}
