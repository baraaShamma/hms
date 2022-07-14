

import 'package:hms/logic/controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/them_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.lazyPut(() => ThemContoller());

  }
  
}