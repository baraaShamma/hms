import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/view/screens/doctors/task_doctor.dart';
import 'package:hms/view/screens/main/articales_screen.dart';
import 'package:hms/view/screens/main/home_screen.dart';
import 'package:hms/view/screens/main/setttings_screen.dart';
import 'package:hms/view/screens/settings/user/pathological_record_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  static GetStorage authBox = GetStorage();

  final tabs = [
    HomeScreen(),
    ArticalesScreen(),
    if (authBox.read("isLoginDoctor") == false)
      PathologicalRecordScreen()
    else
      TaskDoctor(),
    SettingsScreen(),
  ].obs;

  final title = [
    'الصفحة الرئيسية',
    'المقالات الطبية',
    if (authBox.read("isLoginDoctor") == false)
      'السجل المرضي'
    else
      "المهمات المطلوبة",
    'النظام الطبي الافتراضي',
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
