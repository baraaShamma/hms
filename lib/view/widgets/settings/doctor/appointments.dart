import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/screens/settings/doctor/pathological_record_screen_doctor.dart';
import 'package:hms/view/widgets/button_widget.dart';

class Appointments extends StatelessWidget {
  Appointments({Key? key}) : super(key: key);
  final controller = Get.find<HomeDoctorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingDoctorAppointments.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return SizedBox(
            height: MediaQuery.of(context).size.height - 150,
            child: ListView.builder(
              itemCount: controller.doctorAppointmentsList.length,
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
                            height: 200,
                            //alignment: Alignment.topRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "اسم المريض : " +
                                      controller.doctorAppointmentsList[index]
                                          .username,
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
                                        .doctorAppointmentsList[index].date,
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
                                        text: "صفحة المريض",
                                        onPressed: () {
                                          Get.to(() =>
                                           PathologicalRecordScreenDoctor(idUser: controller.doctorAppointmentsList[index].idUser,));
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: SizedBox(
                                        width: 150,
                                        child: ButtonWidget(
                                          text: "تمت المعاينة ",
                                          onPressed: () {

                                           controller.deleteAppointment(controller.doctorAppointmentsList[index].idTask);
                                          },
                                        ),
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
