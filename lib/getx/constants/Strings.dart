// ignore: file_names
class Strings {
  Strings._();

  static String Function(String id) get cartItemGetBuilderId => (String id) => 'CART-BID-$id';
  static String Function(String id) get favItemGetBuilderId => (String id) => 'FAV-BID-$id';
  static String Function(String id) get productItemGetBuilderId => (String id) => 'PROD-BID-$id';
  static const productGetBuilderId = 'PROD-BID';
  static const cartGetBuilderId = 'CART-BID';
  static const favouritesGetBuilderId = 'FAVOURITE-BID';
}
