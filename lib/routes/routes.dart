import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/bindings/auth_binding.dart';
import 'package:hms/logic/bindings/doctor/home_doctor_binding.dart';
import 'package:hms/logic/bindings/main_binding.dart';
import 'package:hms/logic/bindings/user/home_binding.dart';
import 'package:hms/store/logic/bindings/product_binding.dart';
import 'package:hms/store/view/screens/cart_screen.dart';
import 'package:hms/store/view/screens/home_screen.dart';
import 'package:hms/view/screens/auth/forget_password.dart';
import 'package:hms/view/screens/auth/login_screen.dart';
import 'package:hms/view/screens/auth/signup_screen.dart';
import 'package:hms/view/screens/main/main_screen.dart';
import 'package:hms/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  //getpages
  static final routes = [
    GetPage(
      name: RoutesStore.homeStoreScreen,
      page: () => HomeStoreScreen(),
      bindings: [
        ProductBinding(),
      ],
    ),
    GetPage(
      name: RoutesStore.cartScreen,
      page: () => CartScreen(),
      bindings: [
        ProductBinding(),
      ],
    ),

    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgetPassword(),
        binding: AuthBinding()),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
      HomeBinding(),
    ]),
  ];
  static final routesDoctor = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgetPassword(),
        binding: AuthBinding()),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
      HomeBinding(),
      HomeDoctorBinding()
    ]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = "/loginScreen";
  static const signUpScreen = "/signUpScreen";
  static const forgetPasswordScreen = "/forgetPasswordScreen";
  static const mainScreen = "/mainScreen";
}

class RoutesStore {
  static const homeStoreScreen = '/homeStoreScreen';
  static const cartScreen = '/cartScreen';
}