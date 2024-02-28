import 'package:flutter_state_management/models/product.dart';
import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> products = [];

  @override
  void onInit() {
    super.onInit();
    products = List.generate(
      15,
      (index) => Product(
        id: index.toString(),
        description: 'Description of $index',
        name: 'Name of $index',
        price: (index + 1) * 10,
      ),
    );
    update([Strings.productGetBuilderId]);
  }
}
