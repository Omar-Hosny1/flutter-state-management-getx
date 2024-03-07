import 'package:flutter/material.dart';
import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/getx/controllers/favourite_controller.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:get/get.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
      id: Strings.favItemGetBuilderId(product.id),
      builder: (controller) => Card(
        child: ListTile(
          onTap: () {},
          autofocus: true,
          title: Text(product.name),
          trailing: IconButton(
            onPressed: () {
              controller.removeFromFavourites(product);
            },
            icon: Icon(
              Icons.minimize,
            ),
          ),
        ),
      ),
    );
  }
}
