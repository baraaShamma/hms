// To parse this JSON data, do
//
//     final doctoreModel = doctoreModelFromJson(jsonString);

import 'dart:convert';

List<DoctoreModel> doctoreModelFromJson(String str) => List<DoctoreModel>.from(
    json.decode(str).map((x) => DoctoreModel.fromJson(x)));

String doctoreModelToJson(List<DoctoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctoreModel {
  DoctoreModel({
    required this.idUser,
    required this.username,
    required this.email,
    required this.password,
    required this.typeUser,
    required this.idCategorie,
    required this.imageDoctor,
    required this.specialty,
    required this.phon,
    required this.address,
    required this.token,
  });

  String idUser;
  String username;
  String email;
  String password;
  String typeUser;
  String idCategorie;
  String imageDoctor;
  String specialty;
  String phon;
  String address;
  String token;

  factory DoctoreModel.fromJson(Map<String, dynamic> json) => DoctoreModel(
        idUser: json["id_user"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        typeUser: json["type_user"],
        idCategorie: json["id_categorie"],
        imageDoctor: json["image_doctor"],
        specialty: json["specialty"],
        phon: json["phon"],
        address: json["address"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "username": username,
        "email": email,
        "password": password,
        "type_user": typeUser,
        "id_categorie": idCategorie,
        "image_doctor": imageDoctor,
        "specialty": specialty,
        "phon": phon,
        "address": address,
        "token": token,
      };
}
