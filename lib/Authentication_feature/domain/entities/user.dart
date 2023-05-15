import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String? id;
  final String name;
  final String email;
  final String password;
  final String? messages;
  final String? token;
  final String? phone;
  final String? creditCardNumber;
  final String? image;



  const User({required this.id, required this.email, required this.messages, required this.password, required this.name, required this.token, required this.phone, required this.creditCardNumber,required this.image});

  @override
  List<Object?> get props => [id,email,messages,password,name];

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? messages,
    String? token,
    String? phone,
    String? creditCardNumber,
    String? image,
  }){

    return User(id:id??'', email: email??'', messages:messages??'' , password: password??'', name:name??'' , token:token??'' , phone:phone ??'', creditCardNumber:creditCardNumber??'' , image:image??'');
  }







}