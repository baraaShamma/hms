import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/settings/user_doctor/medicalinquiries/view_inquiries_widget.dart';
import '../../../widgets/settings/user_doctor/medicalinquiries/add_inquiries.dart';

class MedicalInquiriesScreen extends StatelessWidget {
  const MedicalInquiriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              title: Text(
                "الاستفسارات الطبية",
                style:
                    TextStyle(color: Get.isDarkMode ? pinkClr : Colors.black),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GetStorage().read("isLoginDoctor")?SizedBox(height: 0,): SizedBox(
                    height: 200,
                    child: AddInquiries(),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: ViewInquiriesWidget())
                ],
              ),
            )));
  }
}
