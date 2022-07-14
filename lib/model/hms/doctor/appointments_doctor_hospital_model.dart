// To parse this JSON data, do
//
//     final appointmentsDoctorHospitalModel = appointmentsDoctorHospitalModelFromJson(jsonString);

import 'dart:convert';

List<AppointmentsDoctorHospitalModel> appointmentsDoctorHospitalModelFromJson(String str) => List<AppointmentsDoctorHospitalModel>.from(json.decode(str).map((x) => AppointmentsDoctorHospitalModel.fromJson(x)));

String appointmentsDoctorHospitalModelToJson(List<AppointmentsDoctorHospitalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentsDoctorHospitalModel {
  AppointmentsDoctorHospitalModel({
  required  this.idTask,
    required this.usernameUser,
    required  this.usernameHospitals,
    required this.text,
    required this.date,
  });

  String idTask;
  String usernameUser;
  String usernameHospitals;
  String text;
  String date;

  factory AppointmentsDoctorHospitalModel.fromJson(Map<String, dynamic> json) => AppointmentsDoctorHospitalModel(
    idTask: json["id_task"],
    usernameUser: json["usernameUser"],
    usernameHospitals: json["usernameHospitals"],
    text: json["text"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id_task": idTask,
    "usernameUser": usernameUser,
    "usernameHospitals": usernameHospitals,
    "text": text,
    "date": date,
  };
}
