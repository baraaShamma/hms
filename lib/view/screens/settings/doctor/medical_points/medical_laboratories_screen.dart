import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/view/widgets/doctor/pathological_record/medical_points/gridView_builder_widget.dart';

class MedicalLaboratoriesScreen extends StatelessWidget {
  final String idUser;

  MedicalLaboratoriesScreen({Key? key, required this.idUser}) : super(key: key);

  final controller = Get.find<HomeDoctorController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: SizedBox(
              child: GridViewBuilderWidget(
                fileName: "medical_laboratory",
                idUser: idUser,
                order: 1,
              ),
            )));
  }
}
