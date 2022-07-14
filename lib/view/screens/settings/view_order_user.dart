import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/view/widgets/settings/view_order_user_widget.dart';

class ViewOrderUserScreen extends StatelessWidget {


  const ViewOrderUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body:  GetBuilder<HomeContoller>(builder: (_) {
          return Column(
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    ViewOrderUserWidget()
                  ],
                ),
              )

            ],
          );
        }));
  }
}
