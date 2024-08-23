import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? email;
  String? uid;
  String? name;
  String? phone;

  UserModel({
    required this.email,
    required this.uid,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        uid: map['UID'],
        name: map['name'],
        phone: map['phoneNumber']);
  }
}
