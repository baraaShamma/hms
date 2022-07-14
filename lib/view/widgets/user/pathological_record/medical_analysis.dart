import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalAnalysis extends StatelessWidget {
  MedicalAnalysis({Key? key}) : super(key: key);
  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: FutureBuilder(
              future:
                  controller.getMedicalAnalysis(controller.idUser),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Obx(() {
                  if (controller.isLoadingMedicalAnalysis.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                    );
                  } else {
                    return SizedBox(
                        child: ListView.builder(
                      itemCount: controller.medicalAnalysisList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                                title: Container(
                                  margin:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "تحليل : " +
                                            controller
                                                .medicalAnalysisList[index]
                                                .text,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      //  Padding(padding: EdgeInsets.only(right: 220),),
                                    ],
                                  ),
                                ),
                                isThreeLine: true,
                                subtitle: Container(
                                  height: 500,
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20),
                                      ),
                                      InteractiveViewer(
                                        panEnabled: true,
                                        // Set it to false
                                        boundaryMargin: EdgeInsets.all(100),
                                        minScale: 0.2,
                                        maxScale: 4.0,
                                        child: Image.network(
                                          "$baseUrl/upload/medical_laboratory_user/${controller.medicalAnalysisList[index].imageLaboratory}",
                                          fit: BoxFit.cover,
                                          height: 400,
                                          width: double.infinity,
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 20, top: 10)),
                                    ],
                                  ),
                                )),
                            const Divider(
                              color: Colors.black,
                              thickness: 5,
                            )
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
