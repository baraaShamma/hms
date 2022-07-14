import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/widgets/user/pathological_record/list_widget.dart';

class MedicalDiagnostics extends StatelessWidget {
  MedicalDiagnostics({Key? key}) : super(key: key);
  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: FutureBuilder(
              future: controller.getMedicalDiagnostics(controller.idUser),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Obx(() {
                  if (controller.isLoadingDiagnostics.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                    );
                  } else {
                    return SizedBox(

                        child: ListView.builder(
                          itemCount: controller.medicalDiagnosticsList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListWidget(
                                    name: controller
                                        .medicalDiagnosticsList[index].username,
                                    content: controller
                                        .medicalDiagnosticsList[index]
                                        .diagnosis,
                                    type: "اسم الطبيب :")
                              ],
                            );
                          },
                        ));
                  }
                });
              }),
        ));
  }
}
