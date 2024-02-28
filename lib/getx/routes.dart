import 'package:flutter_state_management/views/screens/cart.dart';
import 'package:flutter_state_management/views/screens/home.dart';
import 'package:flutter_state_management/views/screens/product_details.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: Home.screenName, page: () => Home()),
  GetPage(name: Cart.screenName, page: () => Cart()),
  GetPage(name: ProductDetails.screenName, page: () => ProductDetails()),
];
