import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/widgets/card_widget.dart';
import 'package:hms/view/widgets/user/pathological_record/medical_analysis.dart';
import 'package:hms/view/widgets/user/pathological_record/medical_diagnostics.dart';
import 'package:hms/view/widgets/user/pathological_record/pharmaceutical.dart';
import 'package:hms/view/widgets/user/pathological_record/xray_pictures.dart';

class PathologicalRecordScreen extends StatelessWidget {
  const PathologicalRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        children: [
        /*  GetStorage().read("isLoginDoctor")
              ? CardDoctorWidget()
              : const SizedBox(
                  height: 0,
                ),*/
          CardWidget(
              text: "التشخيصات الطبية",
              onPressed: () {
                Get.to(() => MedicalDiagnostics());
              }),
          CardWidget(
              text: "التحاليل الطبية",
              onPressed: () {
                Get.to(() => MedicalAnalysis());
              }),
          CardWidget(
              text: "صور الأشعة",
              onPressed: () {
                Get.to(() => XrayPictures());
              }),
          CardWidget(
              text: "الأدوية",
              onPressed: () {
                Get.to(() => Pharmaceutical());
              }),
        ],
      ),
    );
  }
}
