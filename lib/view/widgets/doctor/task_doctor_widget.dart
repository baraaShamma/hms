
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/screens/main/categories/doctors_screen.dart';
import 'package:hms/view/widgets/button_widget.dart';

class TaskDoctorWidget extends StatelessWidget {
  TaskDoctorWidget({Key? key}) : super(key: key);

  final controller = Get.find<HomeDoctorController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Obx(() {
        if (controller.isLoadingTaskDoctor.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height-150,
            child:  FutureBuilder(
                future: controller.getTaskDoctor(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                      itemCount: controller.taskDoctorList.length,

                      itemBuilder: (context, index) {
                        return
                          Container(
                            margin: const EdgeInsets.only(top: 10,left: 4,right: 4),
                            color: Colors.green.shade100,
                            height: 150,
                            width: 100,
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(top: 5),
                                      color: Colors.blue.shade50,
                                      height: 200,
                                      //alignment: Alignment.topRight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("اسم المريض : "+
                                              controller.taskDoctorList[index].username,style: TextStyle(fontSize: 25,color: Colors.black),
                                          ),
                                          ElevatedButton(
                                            child: Text("تحديد الموعد"),
                                            onPressed: ()async{
                                              controller.showDateTimePicker(context,controller.taskDoctorList[index].idUser,controller.taskDoctorList[index].idTask);
                                            },
                                          )

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                      });
                }),
          );
        }
      }),
    );
  }
}
