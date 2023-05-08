import 'package:highway_gates/Authentication_feature/domain/entities/user.dart';

class UserModel extends User{
  const UserModel({required super.id, required super.email,required super.messages,required super.password,required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(id: json['id'],name: json['name'],email: json['email'],password: json['password'],messages: json['messages']);
}
  
  Map<String, dynamic> toJson(){

    return {'id':id,'email':email,'messages':messages,'password':password,'name':name,};


  }
  
}