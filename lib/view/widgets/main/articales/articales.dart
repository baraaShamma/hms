import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/widgets/main/articales/view_articale.dart';

class Articales extends StatelessWidget {
  Articales({Key? key}) : super(key: key);

  final controller = Get.find<HomeContoller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingArticles.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Container(
            color: Get.isDarkMode?Colors.black:Colors.blue.shade50,
            height: MediaQuery.of(context).size.height - 150,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: controller.articlesList.length,
                itemBuilder: (context, index) {
                  return Container(
                 //     height: 150 ,
                    child: InkWell(
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                              //  height: 200,
                                child: Expanded(
                                    child: Image.network(
                                  "http://192.168.1.108:8080/hms/upload/articales/${controller.articlesList[index].imageArticle}",
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                )),
                              ),
                              Container(
                                height: 50,
                                  child: Text(
                                controller.articlesList[index].title,
                                style: TextStyle(
                                    fontSize: 15, color:Get.isDarkMode?Colors.white: Colors.black87),textAlign: TextAlign.center,
                              )),
                              /*  tt?InkWell(child: Icon(Icons.delete_outline,size: 30,color: Colors.blue,),
                                    onTap:(){
                                      setState(() {
                                        delet_article(list[index]['id_art']);

                                      });
                                    }):SizedBox(height: 0,),*/
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.to(() => ViewArticle(
                            title: controller.articlesList[index].title,
                            text: controller.articlesList[index].text,
                            image: controller.articlesList[index].imageArticle,
                          ));
                        }),
                  );
                }));
      }
    });
  }
}
