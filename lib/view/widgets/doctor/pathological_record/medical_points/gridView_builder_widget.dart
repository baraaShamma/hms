import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/doctor/pathological_record/medical_points/view_medical_point_widget.dart';

class GridViewBuilderWidget extends StatelessWidget {
  final String fileName;
  final String idUser;
  final int order;

  final controller = Get.find<HomeDoctorController>();

  GridViewBuilderWidget({
    Key? key,
    required this.fileName,
    required this.idUser,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingMedicalPoint.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return SizedBox(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: controller.medicalPointList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      child: Card(
                        color: Colors.deepPurple.shade50,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                  child: Image.network(
                                      "$baseUrl/upload/${fileName + "/" + controller.medicalPointList[index].image}",
                                      fit: BoxFit.cover),
                                )),
                            Expanded(
                              child: Text(
                                controller.medicalPointList[index].username,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            //end categories1
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(() => ViewMedicalPointWidget(
                            order: order,
                            idUser: idUser,
                            id: controller.medicalPointList[index].idUser,
                            address: controller.medicalPointList[index].address,
                            nameMedicalPoint:
                                controller.medicalPointList[index].username,
                            phone: controller.medicalPointList[index].phon));
                      });
                }));
      }
    });
  }
}
