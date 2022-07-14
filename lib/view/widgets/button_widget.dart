import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/text_utiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ButtonWidget extends StatelessWidget {
  final String text;
  final Function () onPressed;
   ButtonWidget({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:Get.isDarkMode?pinkClr :mainColor,
          minimumSize:const Size(360, 50)
        ),
        onPressed: onPressed ,
        child:TextUtils(
          color:Colors.white,
          text: text,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          underLine: TextDecoration.none,
        )

    );
  }
}
