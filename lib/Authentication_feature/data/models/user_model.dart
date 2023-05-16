import 'package:highway_gates/Authentication_feature/domain/entities/user.dart';

class UserModel extends User{
  const UserModel({required super.id, required super.email,required super.messages,required super.password,required super.name,required super.phone,required super.creditCardNumber, required super.token, required super.image, required super.isValidEmail, required super.isValidPassword,});

  factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(id: json['id'],name: json['name'],email: json['email'],password: json['password'],messages: json['messages'], phone: json['phone'], creditCardNumber: json['creditCardNumber'], token: json['token'], image: json['image'], isValidPassword: json['true'], isValidEmail: json['true']);
}
  
  Map<String, dynamic> toJson(){

    return {'id':id,'email':email,'messages':messages,'password':password,'name':name,};


  }
  
}