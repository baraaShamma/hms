import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/settings/user_doctor/medicalinquiries/comments/comment_list.dart';

class CommentsWidget extends StatelessWidget {


  final controller = Get.find<HomeContoller>();
final String idPost;
   CommentsWidget({Key? key, required this.idPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getComments(idPost),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return  GetBuilder<HomeContoller>(builder: (_) {
            return ListView.builder(
              itemCount: controller.commentsList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommentList(
                      idPost: idPost,
                        comment: controller.commentsList[index].comment,
                        username: controller.commentsList[index].username,
                        comId: controller.commentsList[index].comId,
                        commentUser: controller.commentsList[index].commentUser,
                        id: GetStorage().read("idUser")),
                    Divider(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    )
                  ],
                );
              },
            );
          });
        })
    ;
  }
}
