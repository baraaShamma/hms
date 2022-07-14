import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/view/widgets/auth/text_from_field.dart';

class AddComment extends StatelessWidget {
  final String idPost;

  final controller = Get.find<HomeContoller>();

  AddComment({Key? key, required this.idPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.red))),
          // padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: TextFromField(
                controller: controller.addcomment,
                obscureText: false,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "الرجاء كتابة التعليق";
                  } else {
                    return null;
                  }
                },
                prefixIcon: Text(""),
                suffixIcon: IconButton(
                    icon: const Icon(Icons.send,color: Colors.blue,),
                    onPressed: ()async{

                      await controller.addComment(context, controller.addcomment.text,  GetStorage().read("idUser"),idPost);

                      controller.addcomment.clear();


                    }),
                hintText: "التعليق",
              ),),
        ));
  }
}
