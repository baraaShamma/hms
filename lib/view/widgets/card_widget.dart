import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CardWidget extends StatelessWidget {
  final String text;
  final Function () onPressed;
  CardWidget({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Card(
      color: Get.isDarkMode?Colors.white:Colors.black12,
      child: Column(
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Colors.red.withOpacity(0.2)))),
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   text,
                    style:
                     TextStyle(color:Get.isDarkMode? Colors.black:Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
            onTap:onPressed
          ),
          const Padding(padding: EdgeInsets.only(top: 5, bottom: 5))
        ],
      ),
    );
  }
}
