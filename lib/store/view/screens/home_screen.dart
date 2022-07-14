import 'package:hms/store/view/widgets/tesr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:hms/store/utils/theme.dart';
import 'package:hms/store/view/widgets/home/card_items.dart';
import 'package:hms/store/view/widgets/home/search_text_form.dart';
import 'package:hms/store/view/widgets/text_utils.dart';

class HomeStoreScreen extends StatelessWidget {
  HomeStoreScreen({Key? key}) : super(key: key);
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
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
            appBar: AppBar(

              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text("الصفحة الرئيسية"),
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
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? darkGreyClr : mainColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextUtils(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          text: "متجر",
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextUtils(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          text: "HMS",
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(height: 20),
                        SearchFormText(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextUtils(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      text: "المنتجات",
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CardItems(),
              ],
            ),
          ),
        ));
  }
}
