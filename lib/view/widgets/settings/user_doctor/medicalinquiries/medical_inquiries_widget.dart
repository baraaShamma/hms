import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/screens/settings/medical_inquiries/medical_inquiries_screen.dart';
import 'package:hms/view/widgets/text_utiles.dart';

class MedicalInquiriesWidget extends StatelessWidget {
  MedicalInquiriesWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const MedicalInquiriesScreen());
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
              color: kCOlor4,
            ),
            child: const Icon(
              Icons.post_add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "الاستفسارات الطبية".tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
