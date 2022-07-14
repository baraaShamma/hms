import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/text_utiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function () onPressed;
  const ContainerUnder({Key? key, required this.text, required this.onPressed, required this.textType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      decoration:  BoxDecoration(
          color: Get.isDarkMode?pinkClr :mainColor,
          borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextUtils(
          text: text,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color:Get.isDarkMode? Colors.black:Colors.white,
          underLine: TextDecoration.none),
      TextButton(
          onPressed: onPressed,
        child: TextUtils(
          text: textType,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          underLine: TextDecoration.underline)
      )
        ],
      ),
    );
  }
}
