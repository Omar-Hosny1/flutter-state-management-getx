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
        id: (index + 1).toString(),
        description: 'Description of ${index + 1}',
        name: 'Name of ${index + 1}',
        price: (index + 1) * 10,
      ),
    );
    update([Strings.productGetBuilderId]);
  }
}
