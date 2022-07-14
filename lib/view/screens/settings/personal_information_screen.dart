import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/store/utils/theme.dart';
import 'package:hms/view/widgets/settings/user_doctor/edit.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({Key? key}) : super(key: key);
  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white10,
            title: const Text("تعديل المعلومات الشخصية",
                style: TextStyle(color: Colors.black87)),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: const Text("تعديل العنوان ",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    leading: const Icon(Icons.location_city,
                        color: Colors.blue, size: 25),
                    onTap: () {
                      showEdit(
                          context, "الرجاء ادخال العنوان الجديد", "العنوان",1);
                    },
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: const Text("تعديل الرقم ",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    leading:
                        const Icon(Icons.phone, color: Colors.blue, size: 25),
                    onTap: () {
                      showEdit(context, "الرجاء ادخال رقمك الجديد", "الرقم",2);
                    },
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: const Text("تعديل كلمة المرور ",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    leading: const Icon(Icons.security,
                        color: Colors.blue, size: 25),
                    onTap: () {
                      showEdit(context, "الرجاء ادخال كلمة المرور الجديدة",
                          "Password",3);
                    },
                  )),
            ],
          ),
        ));
  }
}
