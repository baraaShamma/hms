import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/auth/text_from_field.dart';
import 'package:hms/view/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ?darkGreyClr  : Colors.white,
        title: Text(
          "Forget Password",
          style: TextStyle(color: Get.isDarkMode ?pinkClr  : mainColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close_rounded),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "If you to recover your account",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Image.asset(
                    "images/forgetpass copy.png",
                    width: 300,
                    height: 250,
                  ),
                  const SizedBox(
                    height: 35,
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
                        ?const Icon(
                      Icons.email,
                      color: Colors.pink,
                      size: 35,
                    )
                        :Image.asset("images/email.png") ,
                    suffixIcon: const Text(" "),
                    hintText: "Email",
                  ),
                  const SizedBox(height: 35),
                  GetBuilder<AuthController>(builder: (_) {
                    return ButtonWidget(
                        text: "Send",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller
                                .resetPassword(emailController.text.trim());
                          }
                        });
                  })
                ],
              ),
            ),
          )),
    ));
  }
}
