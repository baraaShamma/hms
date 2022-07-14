import 'dart:convert';

List<CategoryStorModel> categoryStorModelFromJson(String str) => List<CategoryStorModel>.from(json.decode(str).map((x) => CategoryStorModel.fromJson(x)));

String categoryStorModelToJson(List<CategoryStorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryStorModel {
  CategoryStorModel({
  required  this.id,
    required   this.categoryName,
    required  this.catImage,
  });

  String id;
  String categoryName;
  String catImage;

  factory CategoryStorModel.fromJson(Map<String, dynamic> json) => CategoryStorModel(
    id: json["id"],
    categoryName: json["category_name"],
    catImage: json["cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "cat_image": catImage,
  };
}
