import 'dart:convert';

List<PharmacyUserModel> pharmacyUserModelFromJson(String str) => List<PharmacyUserModel>.from(json.decode(str).map((x) => PharmacyUserModel.fromJson(x)));

String pharmacyUserModelToJson(List<PharmacyUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PharmacyUserModel {
  PharmacyUserModel({
   required this.text,
  });

  String text;

  factory PharmacyUserModel.fromJson(Map<String, dynamic> json) => PharmacyUserModel(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}
