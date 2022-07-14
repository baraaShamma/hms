// To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);

import 'dart:convert';

List<ProductModels> productModelsFromJson(String str) => List<ProductModels>.from(json.decode(str).map((x) => ProductModels.fromJson(x)));

String productModelsToJson(List<ProductModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModels {
  ProductModels({
   required this.id,
    required   this.title,
    required  this.price,
    required  this.description,
    required  this.imageProduct,
    required  this.idCat,
  });

  String id;
  String title;
  String price;
  String description;
  String imageProduct;
  String idCat;

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    imageProduct: json["image_product"],
    idCat: json["id_cat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "image_product": imageProduct,
    "id_cat": idCat,
  };
}
