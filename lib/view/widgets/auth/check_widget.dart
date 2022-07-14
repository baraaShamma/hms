import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/text_utiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: controller.isCheackBox
                    ? Get.isDarkMode
                        ? Image.asset("images/check.png")
                        : const Icon(
                            Icons.done,
                            color: pinkClr,
                          )
                    : Container()),
            onTap: () {
              controller.cheackBox();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  text: "I accept",
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.blue : Colors.blue,
                  underLine: TextDecoration.none),
              TextUtils(
                  text: " terms & conditions",
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.underline),
            ],
          )
        ],
      );
    });
  }
}
