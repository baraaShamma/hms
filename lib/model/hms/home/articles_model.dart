// To parse this JSON data, do
//
//     final articlesModel = articlesModelFromJson(jsonString);

import 'dart:convert';

List<ArticlesModel> articlesModelFromJson(String str) => List<ArticlesModel>.from(json.decode(str).map((x) => ArticlesModel.fromJson(x)));

String articlesModelToJson(List<ArticlesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticlesModel {
  ArticlesModel({
   required this.idArt,
    required  this.title,
    required this.text,
    required this.imageArticle,
  });

  String idArt;
  String title;
  String text;
  String imageArticle;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
    idArt: json["id_art"],
    title: json["title"],
    text: json["text"],
    imageArticle: json["image_article"],
  );

  Map<String, dynamic> toJson() => {
    "id_art": idArt,
    "title": title,
    "text": text,
    "image_article": imageArticle,
  };
}
