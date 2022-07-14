import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/store/utils/theme.dart';
import 'package:hms/utils/my_string.dart';

class ViewOrderUserWidget extends StatelessWidget {
  ViewOrderUserWidget({Key? key}) : super(key: key);

  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isViewOrderUserLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Column(
          children: [
            Container(
                color: Colors.blue.shade50,
                height: MediaQuery.of(context).size.height ,
                child: GridView.builder(
                  itemCount: controller.viewOrderUserList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 300,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3.0,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  "$baseUrl/store/upload/products/${controller.viewOrderUserList[index].imageProduct}",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "سعر الكمية: \$ ${controller.viewOrderUserList[index].price}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        controller
                                            .viewOrderUserList[index].title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "الكمية " +
                                            controller.viewOrderUserList[index]
                                                .quantity,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ))
          ],
        );
      }
    });
  }
}
