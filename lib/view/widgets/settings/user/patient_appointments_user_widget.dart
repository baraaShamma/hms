import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/screens/settings/user/user_appointments_screen.dart';
import 'package:hms/view/widgets/text_utiles.dart';

class PatientAppointmentsUserWidget extends StatelessWidget {
  PatientAppointmentsUserWidget({Key? key}) : super(key: key);

  final controller = Get.put(HomeContoller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            controller.getAppointment();
            Get.to(() => const UserAppointmentsScreen());
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
                  color: kCOlor2,
                ),
                child: const Icon(
                  Icons.access_time,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                text: "مواعيدي".tr,
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
