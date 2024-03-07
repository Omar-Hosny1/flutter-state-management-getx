import 'package:flutter_state_management/getx/constants/Strings.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  final List<Product> _favourites = [];

  List<Product> get favourites {
    return [..._favourites];
  }

  addToFavourites(Product product) {
    _favourites.add(product);
    product.setInFavourite = true;
    _updateFavouritesGetBuilders(product.id);
  }

  removeFromFavourites(Product product) {
    _favourites.removeWhere((p) => p.id == product.id);
    product.setInFavourite = false;
    _updateFavouritesGetBuilders(product.id);
  }

  _updateFavouritesGetBuilders(String id) {
    update([Strings.favouritesGetBuilderId, Strings.favItemGetBuilderId(id)]);
  }
}
