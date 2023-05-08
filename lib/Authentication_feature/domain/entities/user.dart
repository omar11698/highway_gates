import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String id;
  final String name;
  final String email;
  final String password;
  final String? messages;



  const User({required this.id, required this.email, required this.messages, required this.password, required this.name});

  @override
  List<Object?> get props => [id,email,messages,password,name];

}