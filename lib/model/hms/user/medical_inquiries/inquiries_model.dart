import 'dart:convert';

List<InquiriesModel> inquiriesModelFromJson(String str) => List<InquiriesModel>.from(json.decode(str).map((x) => InquiriesModel.fromJson(x)));

String inquiriesModelToJson(List<InquiriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InquiriesModel {
  InquiriesModel({
   required this.postId,
    required   this.post,
    required  this.postUser,
    required  this.idUser,
    required  this.username,
  });

  String postId;
  String post;
  String postUser;
  String idUser;
  String username;

  factory InquiriesModel.fromJson(Map<String, dynamic> json) => InquiriesModel(
    postId: json["post_id"],
    post: json["post"],
    postUser: json["post_user"],
    idUser: json["id_user"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "post": post,
    "post_user": postUser,
    "id_user": idUser,
    "username": username,
  };
}