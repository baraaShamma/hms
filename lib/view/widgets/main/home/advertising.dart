import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Advertising extends StatelessWidget {
  Advertising({Key? key}) : super(key: key);

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
            height: 190,
            child: Container(
                //height: 100,
                //width: 100,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      "$baseUrl/upload/Advertising/${controller.advertisingList[index].adImages}",
                      fit: BoxFit.fitHeight,
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.SCALE,
                  autoplay: true,
                    autoplayDelay: 1000,
                  itemCount: controller.advertisingList.length,
                  pagination: new SwiperPagination(),
                  control: new SwiperControl(),
                  fade: 1.0,
                  viewportFraction: 0.85,
                )));
      }
    });
  }
}
