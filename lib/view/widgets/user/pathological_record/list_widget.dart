import 'package:flutter/material.dart';
class ListWidget extends StatelessWidget {
  final String type;
  final String name;
  final String content;

  const ListWidget({Key? key, required this.name, required this.content, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen[100],
      child: Column(
        children: [
          ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(children: [
                  Text(type+" "+name,style: const TextStyle(fontSize: 20),),
                  //  Padding(padding: EdgeInsets.only(right: 220),),

                ],),
              ),
              isThreeLine: true,

              subtitle: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20),),
                  Text(
                    "التشخيص: "+content,
                    style: const TextStyle(fontSize: 20,color: Colors.black),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20,top: 10)),
                ],
              )),


          const Padding(padding: EdgeInsets.only(top: 5,bottom: 5))
        ],
      ),
    );
  }
}
