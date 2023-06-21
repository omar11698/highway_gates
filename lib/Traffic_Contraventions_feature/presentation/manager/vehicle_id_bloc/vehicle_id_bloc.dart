import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vehicle_id_event.dart';
part 'vehicle_id_state.dart';

class VehicleIdBloc extends Bloc<VehicleIdEvent, VehicleIdState> {
  VehicleIdBloc() : super(VehicleIdInitial()) {
    on<VehicleIdEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<VehicleIdSearchEvent>(
        (event, emit) => handleVehicleIdSearchEvent(event, emit));
  }

  handleVehicleIdSearchEvent(
      VehicleIdSearchEvent event, Emitter<VehicleIdState> emit) {
      if(event.vehicleId!=""){
        emit(VehicleIdSuccess(message: "success"));
      }else{
        emit(VehicleIdFailed(message: "failed"));
      }


  }
}
