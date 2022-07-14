import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/auth_controller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/view/widgets/auth/text_from_field.dart';
import 'package:hms/view/widgets/dialog/success_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

showEdit(context, title, hintText, i) {
  return showDialog(
      context: context,
      builder: (context) {
        return GetBuilder<HomeContoller>(builder: (controller) {
          return AlertDialog(
              content: Form(
            key: controller.formStatesInformation,
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Text("$title"),
                  const Padding(padding: EdgeInsets.only(bottom: 5, top: 10)),
                  SizedBox(
                    height: 80,
                    width: 300,
                    child: TextFromField(
                      controller: controller.information,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length <= 5) {
                          return "لا يمكن ان يكون الحقل يحوي اقل من 5 احرف";
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 35,
                      ),
                      suffixIcon: const Text(" "),
                      hintText: "$hintText",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DialogButton(
                        child: const Text(
                          "الغاء",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          controller.information.clear();
                          Get.back();
                        },
                        color: Colors.deepPurple,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 70)),
                      DialogButton(
                        child: const Text(
                          "تأكيد",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          if (controller.formStatesInformation.currentState!
                              .validate()) {
                            print(controller.information.text);
                            if (i == 1) {
                              controller.editAddressUser(context);




                            }
                            else if (i == 2) {
                              controller.editPhoneUser(context);
                            }
                            else if (i == 3) {
                              controller.editPasswordUser(context);
                            }
                          }
                        },
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
        });
      });
}
