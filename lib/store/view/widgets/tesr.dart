import 'package:hms/routes/routes.dart';
import 'package:hms/store/routes/routes.dart';
import 'package:hms/store/view/screens/category_screen.dart';
import 'package:hms/store/view/screens/favorites_screen.dart';
import 'package:hms/store/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/hms.png',
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(HomeStoreScreen());
                },
                leading: Icon(Icons.home),
                title: Text('الصفحة الرئيسية'),
              ),
              ListTile(
                onTap: () {
                  Get.to( CategoryScreen());
                },
                leading: Icon(Icons.account_circle_rounded),
                title: Text('الأقسام'),
              ),
              ListTile(
                onTap: () {                  Get.to( FavoritesScreen());
                },
                leading: Icon(Icons.favorite),
                title: Text('المفضلة'),
              ),
              ListTile(
                onTap: () { Get.toNamed(RoutesStore.cartScreen);},
                leading: Icon(Icons.shopping_cart),
                title: Text('سلة المشتريات'),
              ),   ListTile(
                onTap: () { Get.offAndToNamed(Routes.mainScreen);},
                leading: Icon(Icons.local_pharmacy),
                title: Text('Hms'),
              ),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
