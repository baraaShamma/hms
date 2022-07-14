
import 'package:get/get.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/logic/controllers/user/update_location_ambulance.dart';
class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeContoller());
    Get.lazyPut(() => UpdateLocationAmbulance());


  }

}