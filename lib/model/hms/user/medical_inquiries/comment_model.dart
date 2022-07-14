// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
  required  this.comId,
    required   this.comment,
    required  this.commentUser,
    required  this.commentPost,
    required   this.idUser,
    required  this.username,
  });

  String comId;
  String comment;
  String commentUser;
  String commentPost;
  String idUser;
  String username;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    comId: json["com_id"],
    comment: json["comment"],
    commentUser: json["comment_user"],
    commentPost: json["comment_post"],
    idUser: json["id_user"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "com_id": comId,
    "comment": comment,
    "comment_user": commentUser,
    "comment_post": commentPost,
    "id_user": idUser,
    "username": username,
  };
}
