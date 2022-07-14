// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
   required this.idUser,
    required   this.username,
    required  this.typeUser,
  });

  String idUser;
  String username;
  String typeUser;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    idUser: json["id_user"],
    username: json["username"],
    typeUser: json["type_user"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "username": username,
    "type_user": typeUser,
  };
}
