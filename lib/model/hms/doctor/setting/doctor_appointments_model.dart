import 'dart:convert';

List<DoctorAppointmentsModel> doctorAppointmentsModelFromJson(String str) =>
    List<DoctorAppointmentsModel>.from(
        json.decode(str).map((x) => DoctorAppointmentsModel.fromJson(x)));

String doctorAppointmentsModelToJson(List<DoctorAppointmentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorAppointmentsModel {
  DoctorAppointmentsModel({
    required this.idTask,
    required this.idUser,
    required this.username,
    required this.date,
  });

  String idTask;

  String idUser;
  String username;
  String date;

  factory DoctorAppointmentsModel.fromJson(Map<String, dynamic> json) =>
      DoctorAppointmentsModel(
        idUser: json["idUser"],
        username: json["username"],
        date: json["date"],
        idTask: json["idTask"],
      );

  Map<String, dynamic> toJson() => {
        "idTask": idTask,
        "idUser": idUser,
        "username": username,
        "date": date,
      };
}
