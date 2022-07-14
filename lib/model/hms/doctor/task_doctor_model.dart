import 'dart:convert';

List<TaskDoctorModel> taskDoctorModelFromJson(String str) =>
    List<TaskDoctorModel>.from(
        json.decode(str).map((x) => TaskDoctorModel.fromJson(x)));

String taskDoctorModelToJson(List<TaskDoctorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskDoctorModel {
  TaskDoctorModel({
    required this.idTask,
    required this.idUser,
    required this.username,
  });

  String idUser;
  String username;
  String idTask;

  factory TaskDoctorModel.fromJson(Map<String, dynamic> json) =>
      TaskDoctorModel(
        idUser: json["id_user"],
        username: json["username"],
        idTask: json["id_task"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "username": username,
        "id_task": idTask,
      };
}
