import 'package:hms/logic/controllers/them_controller.dart';
import 'package:hms/routes/routes.dart';
import 'package:hms/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HMS',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemContoller().themDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: GetStorage().read<bool>("isLoginDoctor") == true
          ? AppRoutes.routesDoctor
          : AppRoutes.routes,
    );
  }
}
