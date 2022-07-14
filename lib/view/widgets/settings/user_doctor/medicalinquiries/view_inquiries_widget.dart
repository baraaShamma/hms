import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/screens/settings/medical_inquiries/comments/comments_screen.dart';

class ViewInquiriesWidget extends StatelessWidget {
  ViewInquiriesWidget({Key? key}) : super(key: key);
  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
          if (controller.isLoadingInquiries.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            );
          } else {
            return SizedBox(
                height: 200,
                child: FutureBuilder(
                    future: controller.getInquiries(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                        itemCount: controller.inquiriesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            //  color: Colors.lightGreen[100],
                            child: Column(
                              children: [
                                ListTile(
                                    leading: const CircleAvatar(
                                        child: Icon(Icons.person)),
                                    title: Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            controller
                                                .inquiriesList[index].username,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                          ),
                                          controller.inquiriesList[index]
                                                          .postUser ==
                                                      GetStorage()
                                                          .read("idUser") &&
                                                  GetStorage().read(
                                                          "isLoginUser") ==
                                                      true
                                              ? InkWell(
                                                  child: const Icon(
                                                      Icons.delete_outline),
                                                  onTap: () {
                                                    controller
                                                        .deleteMedicalInquiries(
                                                            controller
                                                                .inquiriesList[
                                                                    index]
                                                                .postId);
                                                  },
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                )
                                        ],
                                      ),
                                    ),
                                    isThreeLine: true,
                                    subtitle: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 20),
                                        ),
                                        Text(
                                          controller.inquiriesList[index].post,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Get.isDarkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 20, top: 10)),
                                      ],
                                    )),
                                const Divider(
                                  color: Colors.green,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      child: InkWell(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "التعليقات",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.comment,
                                              color: Colors.grey[900],
                                            )
                                          ],
                                        ),
                                        onTap: () {
                                          Get.to(() => CommentsScreen(
                                                idPost: controller
                                                    .inquiriesList[index]
                                                    .postId,
                                              ));
                                        },
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                    )),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(top: 5))
                              ],
                            ),
                          );
                        },
                      );
                    }));
          }
        }));
  }
}
