import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
class AddInquiries extends StatelessWidget {
   AddInquiries({Key? key}) : super(key: key);
  final TextEditingController inquirie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: TextFormField(
              controller: inquirie,
              maxLength: 500,
              maxLines: 10,
              minLines: 5,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(right: 10,top: 5),
                  hintText: "اضف  استفسارك هنا",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Row(
            children: [
              GetBuilder<HomeContoller>(builder: (contoller) {
                return  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.red.withOpacity(0.2)))),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "إضافة الاستفسار ",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 17),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),
                            Icon(
                              Icons.add_box,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                      onTap: ()async{
                   await contoller.addInquiries(context, inquirie.text,  GetStorage().read("idUser"));
                        inquirie.clear();
                      },
                    ));
              }),
              //addpost

              //end add post
            ],
          )
        ],
      ),
    );
  }
}
