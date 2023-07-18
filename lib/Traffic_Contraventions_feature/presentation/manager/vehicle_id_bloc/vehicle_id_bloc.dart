
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
          return handleVehicleIdSearchEvent(event, emit);
        } );

    on<AddCarBtnClickedEvent>((event,emit)=>handleCarSelectedEvent(event,emit));


  }

  handleVehicleIdSearchEvent(
      VehicleIdSearchEvent event, Emitter<VehicleIdState> emit) {
      if(event.vehicleId!.isNotEmpty){
        emit(VehicleIdSuccess(message: "success",nationalId: event.nationalId,vehicleId: event.vehicleId));
      }else{
        emit(VehicleIdFailed(message: "failed"));
      }


  }

  handleCarSelectedEvent(AddCarBtnClickedEvent event, Emitter<VehicleIdState> emit) {
    if(event.vehicleId!.isNotEmpty){
      emit(VehicleIdSuccess(message: "success",nationalId: event.nationalId,vehicleId: event.vehicleId));
    }else{
      emit(VehicleIdFailed(message: "failed"));
    }
  }
}
