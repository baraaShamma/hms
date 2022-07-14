import 'dart:convert';

List<MedicalDiagnosticsModel> medicalDiagnosticsModelFromJson(String str) =>
    List<MedicalDiagnosticsModel>.from(
        json.decode(str).map((x) => MedicalDiagnosticsModel.fromJson(x)));

String medicalDiagnosticsModelToJson(List<MedicalDiagnosticsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalDiagnosticsModel {
  MedicalDiagnosticsModel({
    required this.id,
    required this.idUser,
    required this.idDoctor,
    required this.diagnosis,
    required this.username,
  });

  String id;
  String idUser;
  String idDoctor;
  String diagnosis;
  String username;

  factory MedicalDiagnosticsModel.fromJson(Map<String, dynamic> json) =>
      MedicalDiagnosticsModel(
        id: json["id"],
        idUser: json["id_user"],
        idDoctor: json["id_doctor"],
        diagnosis: json["diagnosis"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_doctor": idDoctor,
        "diagnosis": diagnosis,
        "username": username,
      };
}
