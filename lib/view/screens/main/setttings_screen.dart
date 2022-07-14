import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/view/widgets/button_widget.dart';
import 'package:hms/view/widgets/settings/doctor/medical_operations_widget.dart';
import 'package:hms/view/widgets/settings/doctor/patient_appointments_widget.dart';
import 'package:hms/view/widgets/settings/icon/dark_mode.dart';
import 'package:hms/view/widgets/settings/icon/logout_widget.dart';
import 'package:hms/view/widgets/settings/icon/orders_widget.dart';
import 'package:hms/view/widgets/settings/icon/personal_information_widget.dart';
import 'package:hms/view/widgets/settings/icon/store_widget.dart';
import 'package:hms/view/widgets/settings/user/ambulance_tracking_widget.dart';
import 'package:hms/view/widgets/settings/user/call_ambulance.dart';
import 'package:hms/view/widgets/settings/user/medical_operations_user_widget.dart';
import 'package:hms/view/widgets/settings/user/patient_appointments_user_widget.dart';
import 'package:hms/view/widgets/settings/user_doctor/medicalinquiries/medical_inquiries_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 450,
                child: ListView(
                  children: [
                    GetStorage().read("isLoginUser")
                        ? PatientAppointmentsUserWidget()
                        : PatientAppointmentsWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    GetStorage().read("isLoginUser")
                        ? MedicalOperationsUserWidget()
                        : MedicalOperationsWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    MedicalInquiriesWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    OrdersWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    PersonalInformationWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                    thickness: 2,
                  ),

                  GetBuilder<HomeContoller>(
                      init: HomeContoller(),
                      builder: (controller)=> Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CallAmbulanceWidget(),
                 //         AmbulanceTrackingWidget()

                        ],
                      ))
                ,

                  Divider(
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                    thickness: 2,
                  ),
                  StoreWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  DarkMode(),
                  const SizedBox(
                    height: 20,
                  ),
                  LogOutWidget()
                ],
              )
            ],
          ),
        ));
  }
}
