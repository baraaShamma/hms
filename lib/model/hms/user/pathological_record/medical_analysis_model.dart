// To parse this JSON data, do
//
//     final medicalAnalysisModel = medicalAnalysisModelFromJson(jsonString);

import 'dart:convert';

List<MedicalAnalysisModel> medicalAnalysisModelFromJson(String str) => List<MedicalAnalysisModel>.from(json.decode(str).map((x) => MedicalAnalysisModel.fromJson(x)));

String medicalAnalysisModelToJson(List<MedicalAnalysisModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalAnalysisModel {
  MedicalAnalysisModel({
    required this.text,
    required  this.imageLaboratory,
  });

  String text;
  String imageLaboratory;

  factory MedicalAnalysisModel.fromJson(Map<String, dynamic> json) => MedicalAnalysisModel(
    text: json["text"],
    imageLaboratory: json["image_laboratory"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "image_laboratory": imageLaboratory,
  };
}
