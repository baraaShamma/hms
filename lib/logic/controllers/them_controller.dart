

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemContoller extends GetxController{
  var swithchValue = false.obs;

  final GetStorage boxStorge=GetStorage();
  final key="isDarkModes";
  saveThemDataInBox(bool isDark){
    boxStorge.write(key, isDark);
  }
  bool getThemDataFromBox(){
    return  boxStorge.read<bool>(key)??false;

  }
  ThemeMode get themDataGet=>
    getThemDataFromBox()?ThemeMode.dark:ThemeMode.light;

  void changesThem(){
    Get.changeThemeMode(getThemDataFromBox()?ThemeMode.light:ThemeMode.dark);
    saveThemDataInBox(!getThemDataFromBox());

  }
}