import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/routes/routes.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/auth/check_widget.dart';
import 'package:hms/view/widgets/auth/container_under.dart';
import 'package:hms/view/widgets/auth/text_from_field.dart';
import 'package:hms/view/widgets/button_widget.dart';
import 'package:hms/view/widgets/text_utiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              text: "LOG",
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none),
                          const SizedBox(
                            width: 5,
                          ),
                          TextUtils(
                              text: "IN",
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFromField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 5 ||
                              !RegExp(validationEmail).hasMatch(value)) {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 35,
                              )
                            : Image.asset("images/email.png"),
                        suffixIcon: const Text(" "),
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return TextFromField(
                          controller: passWordController,
                          obscureText: controller.isVisibilty ? false : true,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return "Password should be langer or wqual to 6 char";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                  size: 35,
                                )
                              : Image.asset("images/lock.png"),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibilty();
                              },
                              icon: controller.isVisibilty
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.black,
                                    )),
                          hintText: "PassWord",
                        );
                      }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetPasswordScreen);
                            },
                            child: TextUtils(
                              text: "Forget PassWord?",
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return ButtonWidget(
                            text: "LOG IN",
                            onPressed: () {
                              if (fromKey.currentState!.validate()) {
                                controller.loginUsingFirebase(
                                    email: emailController.text.trim(),
                                    password: passWordController.text.trim());
                              }
                            });
                      }),
                      const SizedBox(
                        height: 5,
                      ),
                      TextUtils(
                        text: "OR",
                        fontSize: 19,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Image.asset("images/facebook.png"),
                            onTap: () {
                              controller.facebookSignUp();
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                              child: Image.asset("images/google.png"),
                              onTap: () {
                                controller.googelSingUp();
                              },
                            );
                          })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Don't have an Account ? ",
              textType: "Sign Up",
              onPressed: () {
                Get.offNamed(Routes.signUpScreen);
              },
            )
          ],
        ),
      ),
    ));
  }
}
