// To parse this JSON data, do
//
//     final medicalPointsModel = medicalPointsModelFromJson(jsonString);

import 'dart:convert';

List<MedicalPointsModel> medicalPointsModelFromJson(String str) => List<MedicalPointsModel>.from(json.decode(str).map((x) => MedicalPointsModel.fromJson(x)));

String medicalPointsModelToJson(List<MedicalPointsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalPointsModel {
  MedicalPointsModel({
  required  this.idUser,
    required this.username,
    required   this.typeUser,
    required   this.image,
    required   this.phon,
    required   this.address,
  });

  String idUser;
  String username;
  String typeUser;
  String image;
  String phon;
  String address;

  factory MedicalPointsModel.fromJson(Map<String, dynamic> json) => MedicalPointsModel(
    idUser: json["id_user"],
    username: json["username"],
    typeUser: json["type_user"],
    image: json["image"],
    phon: json["phon"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "username": username,
    "type_user": typeUser,
    "image": image,
    "phon": phon,
    "address": address,
  };
}
