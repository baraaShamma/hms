import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/widgets/main/home/categories/view_doctor.dart';

class Doctores extends StatelessWidget {
  Doctores({Key? key}) : super(key: key);


  final homeController = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
      if (homeController.isLoadingDoctores.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Container(
          height: 500,
          child:ListView.builder(
            itemCount: homeController.doctorsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.green.shade100,
                  height: 100,
                  width: 100,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(top: 10),

                            color: Colors.blue.shade50,
                            height: 100,
                            //alignment: Alignment.topRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  homeController.doctorsList[index].username,style: TextStyle(fontSize: 30,color: Colors.black),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ),
                onTap: () {
                //  print(doctoresController.doctoresList[index].idUser);
                  Get.to(ViewDoctore(

                    username:  homeController.doctorsList[index].username,
                    address:  homeController.doctorsList[index].address,
                    image_doct:  homeController.doctorsList[index].imageDoctor,
                    phon:  homeController.doctorsList[index].phon,
                    specialty:  homeController.doctorsList[index].specialty,
                    id:  homeController.doctorsList[index].idUser,
                    tokenDoctor:homeController.doctorsList[index].token ,

                  ));
                  },
              );
            },
          ),
        );
      }
    }));
  }
}
