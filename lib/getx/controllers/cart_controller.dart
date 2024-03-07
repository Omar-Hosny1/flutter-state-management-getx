import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<Product> _cartItems = [];

  List<Product> get cartItems {
    return [..._cartItems];
  }

  addToCart(Product product) {
    if (!_cartItems.contains(product)) {
      _cartItems.add(product);
      product.setInCart = true;
      update([Strings.cartItemGetBuilderId(product.id)]);
    }
    product.setQuantity = product.quantity + 1;
    update([Strings.cartGetBuilderId]);
  }

  removeFromCart(Product product) {
    if (product.quantity == 1) {
      removeFromCartPermuntally(product);
      return;
    }
    product.setQuantity = product.quantity - 1;
    update([Strings.cartGetBuilderId]);
  }

  removeFromCartPermuntally(Product product) {
    product.resetCart();
    _cartItems.removeWhere((p) => p.id == product.id);
    update([
      Strings.cartGetBuilderId,
      Strings.cartItemGetBuilderId(product.id),
    ]);
  }
}
