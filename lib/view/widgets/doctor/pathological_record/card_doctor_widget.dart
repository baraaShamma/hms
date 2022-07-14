import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/view/screens/settings/doctor/medical_points/hospitals_screen.dart';
import 'package:hms/view/screens/settings/doctor/medical_points/medical_laboratories_screen.dart';
import 'package:hms/view/screens/settings/doctor/medical_points/pharmacy_screen.dart';
import 'package:hms/view/screens/settings/doctor/medical_points/radiology_center_screen.dart';

class CardDoctorWidget extends StatelessWidget {
  final String idUser;
  CardDoctorWidget({Key? key,required this.idUser}) : super(key: key);
  final controller = Get.find<HomeDoctorController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: TextFormField(
              controller:controller.addDiagnosticUser,
              maxLength: 5000,
              maxLines: 10,
              minLines: 5,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 10, top: 5),
                  hintText: "اضف  تشخيصك هنا",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.red.withOpacity(0.2)))),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "أضف تشخيص",
                        style: TextStyle(color: Colors.blue, fontSize: 17),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Icon(
                        Icons.add_box,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  controller.addDiagnostic(context,idUser,controller.addDiagnosticUser.text);

                },
              )),

            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            children: [
              // الذهاب الى صفحة التحاليل الطبية
              Expanded(
                  child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.red.withOpacity(0.2)))),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "المخابر الطبية",
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  await controller.getMedicalPoint("medical_laboratory");
                  Get.to(() => MedicalLaboratoriesScreen(idUser: idUser,));
                },
              )),

              //الذهاب الى صفحة مراكز الاشعة
              Expanded(
                  child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.red.withOpacity(0.2)))),
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "الأشعة",
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        print("ds");
                        await controller.getMedicalPoint("radiology_center");
                        Get.to(() => RadiologyCenterScreen(idUser: idUser,));
                      })),

              //الذهاب الى صفحة المشافي

              Expanded(
                  child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.red.withOpacity(0.2)))),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "المشافي",
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        await controller.getMedicalPoint("hospitals");
                        Get.to(() => HospitalsScreen(idUser: idUser,));
                      })),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            children: [
              // الذهاب الى صيدليات
              Expanded(
                  child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.red.withOpacity(0.2)))),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "الصيدليات",
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                onTap: () async{
                  await controller.getMedicalPoint("pharmacy");

                  Get.to(() => PharmacyScreen(idUser: idUser,));

                },
              )),
              Expanded(
                  child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.red.withOpacity(0.2)))),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "صيدلية المتجر",
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              )),
            ],
          ),
        ],
      ),
    );
  }
}
