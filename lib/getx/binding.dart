import 'package:flutter_state_management/getx/controllers/cart_controller.dart';
import 'package:flutter_state_management/getx/controllers/favourite_controller.dart';
import 'package:flutter_state_management/getx/controllers/product_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController(), permanent: true);
    Get.put(CartController(), permanent: true);
    Get.put(FavouriteController(), permanent: true);
  }
}
