import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import '../../../screens/settings/doctor/appointments_doctor_hospital_screen.dart';
import 'package:hms/view/widgets/text_utiles.dart';


class MedicalOperationsWidget extends StatelessWidget {
  MedicalOperationsWidget({Key? key}) : super(key: key);

  final controller = Get.put(HomeDoctorController());




  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) =>
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                controller.getAppointmentsDoctorHospital();

                Get.to(() => const AppointmentsDoctorHospitalScreen());
              },
              splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
              borderRadius: BorderRadius.circular(12),
              customBorder: const StadiumBorder(),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kCOlor3,
                    ),
                    child: const Icon(
                      Icons.timelapse,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: "مواعيد عملياتي".tr,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

