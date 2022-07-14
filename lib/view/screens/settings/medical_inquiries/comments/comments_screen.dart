import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/settings/user_doctor/medicalinquiries/comments/add_comment.dart';
import 'package:hms/view/widgets/settings/user_doctor/medicalinquiries/comments/comments_widget.dart';
import '../../../../widgets/settings/user_doctor/medicalinquiries/add_inquiries.dart';
class CommentsScreen extends StatelessWidget {
  final String idPost;

  CommentsScreen({Key? key, required this.idPost}) : super(key: key);
  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[100],
                      child: const Text("التعليقات",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                          textAlign: TextAlign.center),
                    ),
                    //show comment

                    Container(
                        color: Colors.lightGreen.withOpacity(0.2),
                        height: MediaQuery.of(context).size.height - 190,
                        child:
                            CommentsWidget(
                          idPost: idPost,
                        )),

                    //end show comment
                    const Padding(padding: EdgeInsets.only(top: 10, bottom: 5)),
                    //add comment

                    GetStorage().read("isLoginDoctor")
                        ? AddComment(
                            idPost: idPost,
                          )
                        :const Center(
                            child: Text("فقط الاطباء يمكنهم التعليق"),
                          )
                    //end add comment
                  ],
                )
              ],
            )));
  }
}
