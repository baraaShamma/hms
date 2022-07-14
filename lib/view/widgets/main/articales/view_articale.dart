import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/utils/theme.dart';

class ViewArticle extends StatelessWidget {
  final title;
  final image;
  final text;

  const ViewArticle({Key? key, this.title, this.image, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text(
              title,
              style: TextStyle(color: Get.isDarkMode ? pinkClr : Colors.black,fontSize: 15),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: ListView(children: [
              Container(
                height: 200,
                child: GridTile(
                  child: Image.network(
                      "http://192.168.1.108:8080/hms/upload/articales/${image}",fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                  //    color: Colors.blueGrey,
                      //alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            text,
                            style: TextStyle(fontSize: 30, color: Get.isDarkMode ? Colors.white : Colors.black),textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
