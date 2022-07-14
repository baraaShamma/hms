import 'dart:convert';

List<AmbulanceUserModel> ambulanceUserModelFromJson(String str) =>
    List<AmbulanceUserModel>.from(
        json.decode(str).map((x) => AmbulanceUserModel.fromJson(x)));

String ambulanceUserModelToJson(List<AmbulanceUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AmbulanceUserModel {
  AmbulanceUserModel({
    required this.id_user,
    required this.username,
    required this.latitude,
    required this.longitude,
  });

  String id_user;
  String username;
  String latitude;
  String longitude;

  factory AmbulanceUserModel.fromJson(Map<String, dynamic> json) =>
      AmbulanceUserModel(
        id_user: json["id_user"],
        username: json["username"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": id_user,
        "username": username,
        "latitude": latitude,
        "longitude": longitude,
      };
}
