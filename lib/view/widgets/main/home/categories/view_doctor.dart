import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/button_widget.dart';

class ViewDoctore extends StatelessWidget {
  final id;
  final username;
  final specialty;
  final address;
  final phon;
  final image_doct;
  final tokenDoctor;
  final GetStorage type_user = GetStorage();

  ViewDoctore(
      {Key? key,
      this.id,
      this.username,
      this.specialty,
      this.address,
      this.phon,
      this.image_doct, this.tokenDoctor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              title: Text(
                username,
                style: TextStyle(color: Get.isDarkMode ? pinkClr : Colors.black),
              ),
              centerTitle: true,
            //  backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      child: GridTile(
                        child: Image.network(
                            "$baseUrl/upload/doctor/$image_doct"),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.only(top: 5),),

                    Container(
                        padding: const EdgeInsets.only(right: 2, left: 2),
                        height: 300,
                        child: ListView(
                          children: [
                            Column(children: [
                              myspec(context, "الاختصاص: ", specialty,
                                  Colors.green.shade200, Colors.black),
                              myspec(context, " العنوان: ", address,
                                  Colors.white, Colors.black),
                              myspec(context, " رقم الهاتف: ", phon,
                                  Colors.green.shade200, Colors.black),
                              //  myspec(context, " العنوان: ", widget.address, Colors.white, Colors.blueAccent),
                              const SizedBox(
                                height: 20,
                              ),
                              GetBuilder<HomeContoller>(builder: (contoller) {
                                return type_user.read("isLoginUser")
                                    ? SizedBox(
                                        width: 200,
                                        child: ButtonWidget(
                                            text: "طلب موعد",
                                            onPressed: () {
                                            //  print(tokenDoctor);
                                              contoller.appointmentBooking(context,type_user.read("idUser"),id,tokenDoctor);

                                            }),
                                      )
                                    : const SizedBox(
                                        height: 0,
                                      );
                              })
                            ])
                          ],
                        )),
                  ],
                )
              ],
            )));
  }
}

myspec(context, String feature, String details, Color colorbackground,
    Color colortext) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(10),
    color: colorbackground,
    child: RichText(
      text: TextSpan(
          style: TextStyle(fontSize: 20, color: Colors.black),
          children: <TextSpan>[
            TextSpan(text: feature, style: TextStyle(color: Colors.blue)),
            TextSpan(
              text: details,
              style: TextStyle(color: colortext),
            )
          ]),
    ),
  );
}
