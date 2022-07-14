
import 'dart:convert';

List<AppointmentsUserModel> appointmentsUserModelFromJson(String str) => List<AppointmentsUserModel>.from(json.decode(str).map((x) => AppointmentsUserModel.fromJson(x)));

String appointmentsUserModelToJson(List<AppointmentsUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentsUserModel {
  AppointmentsUserModel({
  required  this.username,
    required  this.date,
    required this.idTask,
  });

  String username;
  String date;
  String idTask;

  factory AppointmentsUserModel.fromJson(Map<String, dynamic> json) => AppointmentsUserModel(
    username: json["username"],
    date: json["date"],
    idTask: json["idTask"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "date": date,
    "idTask": idTask,
  };
}
