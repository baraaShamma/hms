import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/settings/doctor/appointments_doctor_hospital_widget.dart';

class AppointmentsDoctorHospitalScreen extends StatelessWidget {
  const AppointmentsDoctorHospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text(
              " مواعيد عملياتي ",
              style: TextStyle(color: Get.isDarkMode ? pinkClr : mainColor),
            ),
            centerTitle: true,
            //       backgroundColor: ,
            backgroundColor:
            Get.isDarkMode ? darkGreyClr : Colors.blue.shade100,
          ),
          body: Column(
            children: [
              //   Appointments()
              AppointmentsDoctorHospitalWidget()
            ],
          ),
        ));
  }
}
