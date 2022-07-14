import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/button_widget.dart';

class AppointmentsUserHospitalWidget extends StatelessWidget {
  AppointmentsUserHospitalWidget({Key? key}) : super(key: key);
  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeContoller>(builder: (_) {
      if (controller.isLoadingUserAppointmentsHospital) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return SizedBox(
            height: MediaQuery.of(context).size.height - 150,
            child: ListView.builder(
              itemCount: controller.userAppointmentsHospitalList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.green.shade100,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            // padding: EdgeInsets.only(top: 5),
                            color: Colors.blue.shade50,
                            height: 240,
                            //alignment: Alignment.topRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "اسم الطبيب : " +
                                      controller
                                          .userAppointmentsHospitalList[index]
                                          .usernameDoctor,
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                                Text(
                                  "المشفى : " +
                                      controller
                                          .userAppointmentsHospitalList[index]
                                          .usernameHospitals,
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                                const Text(
                                  " الموعد : ",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    controller
                                        .userAppointmentsHospitalList[index]
                                        .date
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ));
      }
    });
  }
}
