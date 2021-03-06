import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/them_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/text_utiles.dart';
class DarkMode extends StatelessWidget {
  final controller = Get.find<ThemContoller>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            value: controller.swithchValue.value,
            onChanged: (value) {
              ThemContoller().changesThem();
              controller.swithchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "Dark Mode".tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}