part of 'vehicle_id_bloc.dart';

@immutable
abstract class VehicleIdEvent {}
class VehicleIdSearchEvent extends VehicleIdEvent{
  final String vehicleId;

  VehicleIdSearchEvent({required this.vehicleId});
}