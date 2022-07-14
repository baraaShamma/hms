// To parse this JSON data, do
//
//     final advertisingModel = advertisingModelFromJson(jsonString);

import 'dart:convert';

List<AdvertisingModel> advertisingModelFromJson(String str) => List<AdvertisingModel>.from(json.decode(str).map((x) => AdvertisingModel.fromJson(x)));

String advertisingModelToJson(List<AdvertisingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvertisingModel {
  AdvertisingModel({
   required this.id,
    required this.adImages,
  });

  String id;
  String adImages;

  factory AdvertisingModel.fromJson(Map<String, dynamic> json) => AdvertisingModel(
    id: json["id"],
    adImages: json["ad_images"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ad_images": adImages,
  };
}
