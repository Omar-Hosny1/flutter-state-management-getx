import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/getx/controllers/cart_controller.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
  static const screenName = '/prod-details';

  final Product product = Get.arguments as Product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Icon(
              Icons.production_quantity_limits,
              size: 200,
            )),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<CartController>(
                  id: Strings.cartItemGetBuilderId(product.id),
                  builder: (controller) => ElevatedButton(
                    onPressed: () {
                      if (product.inCart) {
                        controller.removeFromCart(product);
                        return;
                      }
                      controller.addToCart(product);
                    },
                    child: Text(
                      product.inCart ? 'Remove From Cart' : 'Add to Cart',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle add to favorites action
                  },
                  child: Text('Add to Favorites'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
