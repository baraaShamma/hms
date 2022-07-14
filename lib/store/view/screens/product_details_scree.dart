import 'package:hms/store/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms/store/models/product_models.dart';
import 'package:hms/store/view/widgets/productDetails/add_cart.dart';
import 'package:hms/store/view/widgets/productDetails/clothes_info.dart';
import 'package:hms/store/view/widgets/productDetails/image_sliders.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  const ProductDetailsScreen({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl:
                    "$baseUrl2/upload/products/${productModels.imageProduct}",
              ),
              ClothesInfo(
                title: productModels.title,
                productId: int.parse(productModels.id),
                description: productModels.description,
              ),
              AddCart(
                price: double.parse(productModels.price),
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
