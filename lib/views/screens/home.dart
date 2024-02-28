import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/getx/controllers/product_controller.dart';
import 'package:flutter_state_management/views/screens/cart.dart';
import 'package:flutter_state_management/views/widgets/product-item.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const screenName = '/home';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello App'),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Cart());
            },
            icon: Icon(
              Icons.card_travel,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GetBuilder<ProductController>(
              id: Strings.productGetBuilderId,
              builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, i) {
                      return ProductItem(product: controller.products[i]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
