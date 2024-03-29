part of 'vehicle_id_bloc.dart';

@immutable
abstract class VehicleIdEvent {}
class VehicleIdSearchEvent extends VehicleIdEvent{
  final String vehicleId;
  final String nationalId;

  VehicleIdSearchEvent({required this.vehicleId,required this.nationalId});
}
class AddCarBtnClickedEvent extends VehicleIdEvent{
  final String vehicleId;
  final String nationalId;

  AddCarBtnClickedEvent({required this.vehicleId,required this.nationalId});
}