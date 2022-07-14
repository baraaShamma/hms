import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pharmaceutical extends StatelessWidget {
  Pharmaceutical({Key? key}) : super(key: key);
  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: FutureBuilder(
              future:
              controller.getPharmacyUser(controller.idUser),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Obx(() {
                  if (controller.isLoadingPharmacyUser.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                    );
                  } else {
                    return SizedBox(
                        child: ListView.builder(
                          itemCount: controller.pharmacyUserList.length,
                          itemBuilder: (context, index) {
                            return Column(
                                children: [

                                 pharmacylist(
                              content: controller.pharmacyUserList[index].text,
                            )
                            ],
                            );
                          },
                        ));
                  }
                });
              }),
        ));
  }
}

class pharmacylist extends StatelessWidget {
  final content;

  pharmacylist({this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[100],
      child: Column(
        children: [
          ListTile(
              title: Container(
              //  margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: const [
                    Text(
                      "اسم الدواء : ",
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                    //  Padding(padding: EdgeInsets.only(right: 220),),
                  ],
                ),
              ),
              isThreeLine: true,
              subtitle: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                 // Padding(padding: EdgeInsets.only(bottom: 20, top: 10)),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 5, bottom: 5))
        ],
      ),
    );
  }
}
