

import 'package:hms/view/widgets/main/home/advertising.dart';
import 'package:hms/view/widgets/main/home/categories_item.dart';
import 'package:hms/view/widgets/main/home/test.dart';
import 'package:hms/view/widgets/text_utiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: TextUtils(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  text: "الأقسام",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Categories(),
              const SizedBox(
                height: 10,
              ),
              Advertising(),




            ],
          ),
        ));
  }
}
