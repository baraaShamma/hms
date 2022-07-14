import 'dart:convert';

List<XrayPicturesModel> xrayPicturesModelFromJson(String str) => List<XrayPicturesModel>.from(json.decode(str).map((x) => XrayPicturesModel.fromJson(x)));

String xrayPicturesModelToJson(List<XrayPicturesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class XrayPicturesModel {
  XrayPicturesModel({
  required  this.imageRadiology,
    required this.text,
  });

  String imageRadiology;
  String text;

  factory XrayPicturesModel.fromJson(Map<String, dynamic> json) => XrayPicturesModel(
    imageRadiology: json["image_radiology"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "image_radiology": imageRadiology,
    "text": text,
  };
}
