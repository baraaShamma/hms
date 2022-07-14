import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/screens/main/categories/doctors_screen.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Container(
          color: Colors.blue.shade50,
          height: MediaQuery.of(context).size.height - 420,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 1, crossAxisCount: 2),
              itemCount: controller.categoriesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                    child: Card(
                      elevation: 2,
                      color: Colors.deepPurple.shade50,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.infinity,
                                  child: Image.network(
                                      "$baseUrl/upload/${controller.categoriesList[index].catImage}",
                                      fit: BoxFit.fill),
                                )),
                            Expanded(
                              child: Text(
                                controller.categoriesList[index].catName,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                            ),
                      
                            //end categories1
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      controller
                          .getDoctors(controller.categoriesList[index].id);
                      Get.to(() => DoctorsScreen(
                            nameCategory:
                                controller.categoriesList[index].catName,
                          ));
                    });
              }),
        );
      }
    });
  }
}
