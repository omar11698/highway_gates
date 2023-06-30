part of 'vehicle_id_bloc.dart';

@immutable
abstract class VehicleIdState {}

class VehicleIdInitial extends VehicleIdState {}
class VehicleIdSuccess extends VehicleIdState {
  final String message;
  final String vehicleId,nationalId;

  VehicleIdSuccess({required this.message,required this.vehicleId,required this.nationalId,});

}
class VehicleIdFailed extends VehicleIdState {
  final String message;
  VehicleIdFailed({required this.message});
}
