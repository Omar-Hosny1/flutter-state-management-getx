import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<Product> _cartItems = [];

  List<Product> get cartItems {
    return [..._cartItems];
  }

  addToCart(Product product) {
    product.setInCart = true;
    final productIndex = _getProductWithIndexOf(product.id);
    if (productIndex == -1) {
      product.setQuantity = 1;
      _cartItems.add(product);
      updateTheCartListeners(product.id);
      return;
    }
    _cartItems[productIndex].setQuantity =
        _cartItems[productIndex].quantity + 1;
    updateTheCartListeners(product.id);
  }

  removeFromCart(Product product) {
    final productIndex = _getProductWithIndexOf(product.id);
    if (_cartItems[productIndex].quantity == 1) {
      product.setInCart = false;
      _cartItems.removeWhere((element) => element.id == product.id);
      updateTheCartListeners(product.id);
      return;
    }
    _cartItems[productIndex].setQuantity =
        _cartItems[productIndex].quantity - 1;
    updateTheCartListeners(product.id);
  }

  int _getProductWithIndexOf(String id) {
    for (var i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].id == id) {
        return i;
      }
    }
    return -1;
  }

  removeFromCartPermuntly(Product product) {
    final productIndex = _getProductWithIndexOf(product.id);
    _cartItems[productIndex].setInCart = false;
    _cartItems.removeWhere((element) => element.id == product.id);
    updateTheCartListeners(product.id);
  }

  updateTheCartListeners(String id) {
    update([Strings.cartGetBuilderId]);
    update([Strings.cartItemGetBuilderId(id)]);
  }
}
