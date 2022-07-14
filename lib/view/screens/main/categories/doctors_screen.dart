import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/widgets/main/home/categories/doctore_widget.dart';

class DoctorsScreen extends StatelessWidget {
  final String nameCategory;

  const DoctorsScreen({Key? key, required this.nameCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text(
              nameCategory,
              style: TextStyle(color: Get.isDarkMode ? pinkClr : Colors.black),
            ),
            centerTitle: true,
          ),
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Doctores()
              // Categories(),
            ],
          ),
        )));
  }
}
