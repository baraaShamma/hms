import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/settings/user/ambulance_tracking_widget.dart';
import 'package:hms/view/widgets/text_utiles.dart';

class CallAmbulanceWidget extends StatelessWidget {
  CallAmbulanceWidget({Key? key}) : super(key: key);

  final controller = Get.put(HomeContoller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.baraaa.isTrue
          ? InkWell(
              onTap: () {
                Get.to(AmbulanceTrackingWidget());
                //print(controller.idAmbulance);
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
                      color: Colors.red,
                    ),
                    child: const Icon(
                      Icons.local_hospital_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: "تتبع سيارة الإسعاف".tr,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none,
                      ),
                    ],
                  )
                ],
              ),
            )
          : InkWell(
              onDoubleTap: () {
                controller.getHospitalAmbulance(context);
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
                      color: Colors.red,
                    ),
                    child: const Icon(
                      Icons.local_hospital_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: "طلب الاسعاف".tr,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "يرجى الضغط\n مرتين عند طلب الإسعاف",
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
    });
  }
}
