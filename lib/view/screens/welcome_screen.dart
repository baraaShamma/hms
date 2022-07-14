import 'package:hms/routes/routes.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/screens/auth/login_screen.dart';
import 'package:hms/view/widgets/text_utiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "images/bar.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: TextUtils(
                    underLine: TextDecoration.none,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    text: 'Welcome',
                    color: Colors.white,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        underLine: TextDecoration.none,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        text: 'HMS',
                        color: mainColor,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      TextUtils(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        text: '',
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10)),
                    onPressed: () {
                     // Get.to(LoginScreen());
                      //Get.toNamed(Routes.loginScreen);
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      text: 'Get Start',
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        underLine: TextDecoration.none,
                        text: "Don't have an Account?",
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: TextUtils(
                          underLine: TextDecoration.underline,
                          text: 'Sigup',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
