import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;

  const Failure({required this.message});
}
class MyFirebaseException extends Failure{
  @override
  final String message;

  MyFirebaseException({required this.message}) : super(message: message);
  @override
  List<Object?> get props => [];

}
