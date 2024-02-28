import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/getx/controllers/cart_controller.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:flutter_state_management/views/screens/product_details.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(ProductDetails.screenName, arguments: product);
      },
      style: ListTileStyle.list,
      leading: CircleAvatar(
        child: Text(product.id),
      ),
      title: Text(product.name),
      trailing: GetBuilder<CartController>(
        id: Strings.cartItemGetBuilderId(
          product.id,
        ),
        builder: (controller) => IconButton(
          icon: Icon(
            product.inCart ? Icons.shopping_bag : Icons.shopping_bag_outlined,
          ),
          onPressed: () {
            if (product.inCart) {
              controller.removeFromCartPermuntly(product);
              return;
            }
            controller.addToCart(product);
          },
        ),
      ),
    );
  }
}
