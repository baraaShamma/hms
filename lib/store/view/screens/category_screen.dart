import 'package:hms/store/utils/theme.dart';
import 'package:hms/store/view/widgets/tesr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:hms/store/view/widgets/category/category_widget.dart';
import 'package:hms/store/view/widgets/text_utils.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
 final _advancedDrawerController = AdvancedDrawerController();

 void _handleMenuButtonPressed() {
   _advancedDrawerController.showDrawer();
 }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        drawer: MyDrawer(),
        backdropColor: Colors.blueGrey,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child:SafeArea(
          child: Scaffold(
            appBar: AppBar( backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text("الأقسام"),
              centerTitle: true,
              leading:      IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            backgroundColor: context.theme.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: TextUtils(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        text: "Category",
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CategoryWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}
