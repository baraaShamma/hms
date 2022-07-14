import 'package:hms/logic/controllers/main_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(child: Obx(() {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              leading: Container(),

              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
              elevation: 5,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.article_outlined,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.article_outlined,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.panorama_horizontal,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.panorama_horizontal,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.insights,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.insights,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ""),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        })));
  }
}
