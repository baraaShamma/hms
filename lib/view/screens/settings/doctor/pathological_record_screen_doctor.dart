import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/widgets/card_widget.dart';
import 'package:hms/view/widgets/doctor/pathological_record/card_doctor_widget.dart';
import 'package:hms/view/widgets/doctor/pathological_record/medical_analysis.dart';
import 'package:hms/view/widgets/doctor/pathological_record/medical_diagnostics.dart';
import 'package:hms/view/widgets/doctor/pathological_record/pharmaceutical.dart';
import 'package:hms/view/widgets/doctor/pathological_record/xray_pictures.dart';

class PathologicalRecordScreenDoctor extends StatelessWidget {
  final String idUser;

  PathologicalRecordScreenDoctor({Key? key, required this.idUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: ListView(
            children: [
              CardDoctorWidget(idUser: idUser),
              CardWidget(
                  text: "التشخيصات الطبية",
                  onPressed: () {
                    Get.to(() => MedicalDiagnostics(
                          idUser: idUser,
                        ));
                  }),
              CardWidget(
                  text: "التحاليل الطبية",
                  onPressed: () {
                    Get.to(() => MedicalAnalysis(idUser: idUser));
                  }),
              CardWidget(
                  text: "صور الأشعة",
                  onPressed: () {
                    Get.to(() => XrayPictures(idUser: idUser));
                  }),
              CardWidget(
                  text: "الأدوية",
                  onPressed: () {
                    Get.to(() => Pharmaceutical(idUser: idUser));
                  }),
            ],
          ),
        ));
  }
}
