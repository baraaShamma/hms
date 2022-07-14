
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
class HomeDoctorBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeDoctorController());

  }

}