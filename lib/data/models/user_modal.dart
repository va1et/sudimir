import 'dart:convert';

import 'package:agro_hack23/data/models/business_modal.dart';
import 'package:agro_hack23/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required name,
    required id,
    required lastName,
    required secondName,
    required email,
    required phone,
    required role,
  }) : super(
            id: id,
            name: name,
            lastName: lastName,
            secondName: secondName,
            email: email,
            phone: phone,
            role: role);

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["guid"],
      name: json["first_name"],
      lastName: json["last_name"],
      secondName: json["middle_name"],
      email: json["email"],
      phone: json["phone"],
      role: json["role"],
    );
  }
  Map<String, dynamic> toJson() => {
        "firstName": name,
        "guid": id,
        "lastName": lastName,
        "middleName": secondName,
        "email": email,
        "phone": phone,
        "role": role
      };
}
