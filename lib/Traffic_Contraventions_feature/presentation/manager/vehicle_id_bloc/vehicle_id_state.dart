part of 'vehicle_id_bloc.dart';

@immutable
abstract class VehicleIdState {}

class VehicleIdInitial extends VehicleIdState {}
class VehicleIdSuccess extends VehicleIdState {
  final String message;

  VehicleIdSuccess({required this.message});

}
class VehicleIdFailed extends VehicleIdState {
  final String message;
  VehicleIdFailed({required this.message});
}
