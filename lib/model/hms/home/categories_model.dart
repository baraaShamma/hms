import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    required this.id,
    required this.catName,
    required this.catImage,
  });

  String id;
  String catName;
  String catImage;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    id: json["id"],
    catName: json["cat_name"],
    catImage: json["cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cat_name": catName,
    "cat_image": catImage,
  };
}
