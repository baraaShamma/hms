import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/routes/routes.dart';
import 'package:hms/store/models/product_models.dart';
import 'package:hms/store/services/product_services.dart';
import 'package:hms/store/utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFarmCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(RoutesStore.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal => productsMap.entries
      .map((e) => double.parse(e.key.price) * e.value)
      .toList();

  get total => productsMap.entries
      .map((e) => double.parse(e.key.price) * e.value)
      .toList()
      .reduce((value, element) => value + element);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

  addOrderUser(context) async {
    if (GetStorage().read("isLoginUser")) {
      Get.defaultDialog(
        title: "تأكيد عملية الشراء",
        titleStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        middleText: 'هل أنت متأكد من اتمام عملية الشراء',
        middleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: " No ",
        cancelTextColor: Colors.white,
        textConfirm: " YES ",
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.toNamed(RoutesStore.cartScreen);
        },
        onConfirm: () async {
          Get.back();

          for (int i = 0; i < productsMap.length; i++) {
            await ProductServices.addOrderUser(
                context,
                GetStorage().read("idUser"),
                productsMap.keys.toList()[i].id.toString(),
                productsMap.values.toList()[i].toString(),
                productSubTotal[i].toString());
          }
          Get.defaultDialog(
            title: "تم الطلب بنجاح",
            titleStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'سيتم ارسال الطلب اليك في اسرع وقت',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textConfirm: " Ok ",
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
              productsMap.clear();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor,
      );
    } else {
      Get.defaultDialog(
        title: "تأكيد عملية الشراء",
        titleStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        middleText: 'هل أنت متأكد من اتمام عملية الشراء',
        middleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: " No ",
        cancelTextColor: Colors.white,
        textConfirm: " YES ",
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.toNamed(RoutesStore.cartScreen);
        },
        onConfirm: () async {
          Get.back();

          for (int i = 0; i < productsMap.length; i++) {
            await ProductServices.addOrderDoctor(
                context,
                GetStorage().read("idUser"),
                productsMap.keys.toList()[i].id.toString(),
                productsMap.values.toList()[i].toString(),
                productSubTotal[i].toString());
          }
          Get.defaultDialog(
            title: "تم الطلب بنجاح",
            titleStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'سيتم ارسال الطلب اليك في اسرع وقت',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textConfirm: " Ok ",
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
              productsMap.clear();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor,
      );
    }
  }

}
