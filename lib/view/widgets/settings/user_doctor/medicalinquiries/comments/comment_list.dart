import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/doctor/home_doctor_contrller.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';

class CommentList extends StatelessWidget {
  final String username;
  final String comment;
  final String comId;
  final String commentUser;
  final String id;
  final String idPost;

  CommentList(
      {required this.comment,
      required this.username,
      required this.comId,
      required this.commentUser,
      required this.id,required this.idPost});
  final homeContoller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //trailing: Icon(Icons.delete_outline),
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Container(
          margin: EdgeInsets.only(top: 15, bottom: 5),
          child: Row(
            children: [
              Text(
                "الدكتور : " + username,
                style: TextStyle(color: Colors.blueAccent[600]),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
              ),
              GetStorage().read("isLoginDoctor") && commentUser == id
                  ? GetBuilder<HomeDoctorController>(builder: (controller) {
                      return InkWell(
                        child: Icon(Icons.delete_outline),
                        onTap: () {
                          controller.deleteComment(comId);
                          homeContoller.getComments(idPost);
                         // print(comId);
                        },
                      );
                    })
                  : const SizedBox(
                      height: 0,
                    )
            ],
          )),
      subtitle: Container(
        padding: const EdgeInsets.all(10),
        //color: Colors.grey[300],
        child: Text(
          comment,
          style: TextStyle(
              fontSize: 20,
              color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
