import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/button_widget.dart';

class AppointmentsDoctorHospitalWidget extends StatelessWidget {
  AppointmentsDoctorHospitalWidget({Key? key}) : super(key: key);
  final controller = Get.find<HomeDoctorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingDoctorAppointmentsHospital.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height - 150,
            child: ListView.builder(
              itemCount: controller.doctorAppointmentsHospitalList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.green.shade100,
                  height: 250,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                                  "اسم المريض : " +
                                      controller
                                          .doctorAppointmentsHospitalList[index]
                                          .usernameUser,
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                                Text(
                                  "المشفى : " +
                                      controller
                                          .doctorAppointmentsHospitalList[index]
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
                                        .doctorAppointmentsHospitalList[index]
                                        .date.toString(),
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 150,
                                      child: ButtonWidget(
                                        text: "تمت العملية",
                                        onPressed: () {
                                          controller
                                              .deleteAppointmentsDoctorHospital(
                                              controller
                                                  .doctorAppointmentsHospitalList[index]
                                                  .idTask);
                                        },
                                      ),
                                    ),

                                  ],
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
