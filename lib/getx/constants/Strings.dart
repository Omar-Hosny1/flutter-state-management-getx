class Strings {
  Strings._();

  static final cartItemGetBuilderId = (String id) => 'CART-BID-${id}';
  static final favItemGetBuilderId = (String id) => 'FAV-BID-${id}';
  static final productItemGetBuilderId = (String id) => 'PROD-BID-${id}';
  static const productGetBuilderId = 'PROD-BID';
  static const cartGetBuilderId = 'CART-BID';
}
