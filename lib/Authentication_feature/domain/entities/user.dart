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
  final bool? isValidEmail;
  final bool? isValidPassword;


  const User( {this.id='', required this.email,  this.messages='', required this.password, required this.name, required this.token,  this.phone='',  this.creditCardNumber='', this.image='',required this.isValidEmail,required this.isValidPassword,});

  @override
  List<Object?> get props => [id,email,messages,password,name,token,phone,creditCardNumber,image];

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
    bool? isValidEmail,
    bool? isValidPassword,
  }){

    return User(id:id??this.id, email: email??this.email, messages:messages??this.messages , password: password??this.password, name:name??this.name , token:token??this.token , phone:phone ??this.phone, creditCardNumber:creditCardNumber??this.creditCardNumber , image:image??this.image, isValidEmail:isValidEmail??this.isValidEmail, isValidPassword:isValidPassword??this.isValidPassword);
  }







}