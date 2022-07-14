import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';

class ViewMedicalPointWidget extends StatelessWidget {
  final int order;
  final String id;
  final String nameMedicalPoint;
  final String address;
  final String phone;
  final String idUser;

  ViewMedicalPointWidget({Key? key,
    required this.id,
    required this.nameMedicalPoint,
    required this.address,
    required this.phone,
    required this.idUser, required this.order})
      : super(key: key);
  TextEditingController _addpost = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                nameMedicalPoint,
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.blue.shade100,
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    //Padding(padding: EdgeInsets.only(top: 5),),

                    Container(
                        padding: EdgeInsets.only(right: 2, left: 2),
                        height: 150,
                        child: Container(
                          child: Column(
                            children: [
                              myspec(context, " العنوان: ", address,
                                  Colors.white, Colors.black),
                              myspec(context, " رقم الهاتف: ", phone,
                                  Colors.green.shade200, Colors.black),
                              Padding(padding: EdgeInsets.only(top: 5)),
                            ],
                          ),
                        )),
                    GetBuilder<HomeDoctorController>(builder: (contoller) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: TextFormField(
                                controller: contoller.addTaskMedicalPointUser,
                                maxLength: 1000,
                                maxLines: 10,
                                minLines: 5,
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.only(right: 10, top: 5),
                                    hintText: " ",
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.red),
                                        borderRadius: BorderRadius.circular(
                                            10))),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.red
                                                        .withOpacity(0.2)))),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: const [
                                            Text(
                                              " طلب",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 17),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10)),
                                            Icon(
                                              Icons.add_box,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        contoller.addTaskMedicalPoint(
                                            context, order, idUser, id,
                                            contoller.addTaskMedicalPointUser
                                                .text);
                                      },
                                    )),
                                //end add post
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                )
              ],
            )));
  }
}

myspec(context, String feature, String details, Color colorbackground,
    Color colortext) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
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
