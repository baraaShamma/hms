// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hms/logic/controllers/user/home_controller.dart';
// class EditAddress extends StatelessWidget {
//   const EditAddress({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  GetBuilder<HomeContoller>(builder: (_) {
//       return TextFromField(
//         controller: passWordController,
//         obscureText: controller.isVisibilty ? false : true,
//         validator: (value) {
//           if (value.toString().length < 6) {
//             return "Password should be langer or wqual to 6 char";
//           } else {
//             return null;
//           }
//         },
//         prefixIcon: Get.isDarkMode
//             ? const Icon(
//           Icons.lock,
//           color: Colors.black,
//           size: 35,
//         )
//             : Image.asset("images/lock.png"),
//         suffixIcon: IconButton(
//             onPressed: () {
//               controller.visibilty();
//             },
//             icon: controller.isVisibilty
//                 ? const Icon(
//               Icons.visibility,
//               color: Colors.black,
//             )
//                 : const Icon(
//               Icons.visibility_off_outlined,
//               color: Colors.black,
//             )),
//         hintText: "PassWord",
//       );
//     });
//   }
// }
