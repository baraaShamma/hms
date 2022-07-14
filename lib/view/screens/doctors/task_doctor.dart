
import 'package:hms/utils/theme.dart';
import 'package:hms/view/widgets/doctor/task_doctor_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDoctor extends StatelessWidget {


   TaskDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              TaskDoctorWidget()
            ],
          )
        ));
  }
}
