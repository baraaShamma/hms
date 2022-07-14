import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingAdvertising.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Container(
          // color: Colors.blue.shade50,
            height: 50,
            child: Container(
              //height: 100,
              //width: 100,
                child: ElevatedButton(
                  onPressed: ()async{
                    var myToken;
                 //   controller.sendPushMessage();
                 //    await controller.messaging.getToken().then((value) {
                 //
                 //      myToken=value;
                 //    });
                 //    print(myToken);
                  },
                  child: const Text("getToken"),
                )
            ));
      }
    });
  }
}
