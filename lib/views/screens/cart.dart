import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/getx/controllers/cart_controller.dart';
import 'package:flutter_state_management/views/widgets/cart-item.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  static const screenName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            GetBuilder<CartController>(
              builder: (controller) {
                return Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: controller.cartItems.length > 0
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return CartItem(
                                product: controller.cartItems[index],
                              );
                            },
                            itemCount: controller.cartItems.length,
                          )
                        : Center(
                            child: Icon(
                            Icons.emoji_transportation,
                            size: 180,
                          )),
                  ),
                );
              },
              id: Strings.cartGetBuilderId,
            )
          ],
        ),
      ),
    );
  }
}
