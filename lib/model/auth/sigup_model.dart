// To parse this JSON data, do
//
//     final sigupModel = sigupModelFromJson(jsonString);

import 'dart:convert';

SigupModel sigupModelFromJson(String str) => SigupModel.fromJson(json.decode(str));

String sigupModelToJson(SigupModel data) => json.encode(data.toJson());

class SigupModel {
  SigupModel({
  required  this.username,
    required  this.email,
    required this.address,
    required  this.phon,
  });

  String username;
  String email;
  String address;
  String phon;

  factory SigupModel.fromJson(Map<String, dynamic> json) => SigupModel(
    username: json["username"],
    email: json["email"],
    address: json["address"],
    phon: json["phon"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "address": address,
    "phon": phon,
  };
}
