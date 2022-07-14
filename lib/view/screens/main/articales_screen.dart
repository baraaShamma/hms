import 'package:get_storage/get_storage.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/view/widgets/main/articales/articales.dart';

class ArticalesScreen extends StatelessWidget {
  final GetStorage authBox = GetStorage();

   ArticalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Articales(),

            ],
          ),
        ));
  }
}
