// To parse this JSON data, do
//
//     final viewOrderModel = viewOrderModelFromJson(jsonString);

import 'dart:convert';

List<ViewOrderModel> viewOrderModelFromJson(String str) => List<ViewOrderModel>.from(json.decode(str).map((x) => ViewOrderModel.fromJson(x)));

String viewOrderModelToJson(List<ViewOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewOrderModel {
  ViewOrderModel({
  required  this.idOrder,
    required  this.username,
    required  this.address,
    required  this.phon,
    required   this.title,
    required  this.imageProduct,
    required  this.quantity,
    required  this.price,
  });

  String idOrder;
  String username;
  String address;
  String phon;
  String title;
  String imageProduct;
  String quantity;
  String price;

  factory ViewOrderModel.fromJson(Map<String, dynamic> json) => ViewOrderModel(
    idOrder: json["id_order"],
    username: json["username"],
    address: json["address"],
    phon: json["phon"],
    title: json["title"],
    imageProduct: json["image_product"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id_order": idOrder,
    "username": username,
    "address": address,
    "phon": phon,
    "title": title,
    "image_product": imageProduct,
    "quantity": quantity,
    "price": price,
  };
}
