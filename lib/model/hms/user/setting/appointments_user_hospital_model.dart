import 'dart:convert';

List<AppointmentsUserHospitalModel> appointmentsUserHospitalModelFromJson(String str) => List<AppointmentsUserHospitalModel>.from(json.decode(str).map((x) => AppointmentsUserHospitalModel.fromJson(x)));

String appointmentsUserHospitalModelToJson(List<AppointmentsUserHospitalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentsUserHospitalModel {
  AppointmentsUserHospitalModel({
  required  this.usernameDoctor,
    required  this.usernameHospitals,
    required  this.text,
    required  this.date,
  });

  String usernameDoctor;
  String usernameHospitals;
  String text;
  String date;

  factory AppointmentsUserHospitalModel.fromJson(Map<String, dynamic> json) => AppointmentsUserHospitalModel(
    usernameDoctor: json["usernameDoctor"],
    usernameHospitals: json["usernameHospitals"],
    text: json["text"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "usernameDoctor": usernameDoctor,
    "usernameHospitals": usernameHospitals,
    "text": text,
    "date": date,
  };
}
