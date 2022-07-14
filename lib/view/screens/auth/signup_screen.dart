import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/routes/routes.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/auth/check_widget.dart';
import 'package:hms/view/widgets/auth/container_under.dart';
import 'package:hms/view/widgets/auth/text_from_field.dart';
import 'package:hms/view/widgets/button_widget.dart';
import 'package:hms/view/widgets/text_utiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final controller = Get.find<AuthController>();

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
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Form(
                  key: fromKey,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              text: "SIGN",
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none),
                          const SizedBox(
                            width: 5,
                          ),
                          TextUtils(
                              text: "Up",
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
                        controller: nameController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2) {
                            return "Enter valid name";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 35,
                              )
                            : const Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 35,
                              ),
                        suffixIcon: const Text(" "),
                        hintText: "User Name",
                      ),
                      const SizedBox(
                        height: 10,
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
                            : const Icon(
                                Icons.email,
                                color: Colors.blue,
                                size: 35,
                              ),
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
                              : const Icon(
                                  Icons.lock,
                                  color: Colors.blue,
                                  size: 35,
                                ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      TextFromField(
                        controller: phoneController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length < 10) {
                            return "Invalid Phone";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.phone,
                                color: Colors.black,
                                size: 35,
                              )
                            : const Icon(
                                Icons.phone,
                                color: Colors.blue,
                                size: 35,
                              ),
                        suffixIcon: const Text(" "),
                        hintText: "Phone",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFromField(
                        controller: addressController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 5) {
                            return "Invalid address";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.add_reaction_sharp,
                                color: Colors.black,
                                size: 35,
                              )
                            : const Icon(
                                Icons.location_city,
                                color: Colors.blue,
                                size: 35,
                              ),
                        suffixIcon: const Text(" "),
                        hintText: "Address",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(builder: (controller) {
                        return ButtonWidget(
                            text: "Sign up",
                            onPressed: () {
                              if (controller.isCheackBox == false) {
                                Get.snackbar("Check Box ",
                                    "Pleas, Accept terms & Conditions",
                                    backgroundColor: Colors.green);
                              } else if (fromKey.currentState!.validate()) {
                                controller.signUPUsingFirebase(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passWordController.text,
                                    address: addressController.text,
                                    phone: phoneController.text);
                              }
                            });
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: "Already have an Account ? ",
              textType: "Login",
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
            )
          ],
        ),
      ),
    ));
  }
}
