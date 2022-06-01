import 'package:g_sneaker/repositories/cart_repository.dart';
import 'package:g_sneaker/repositories/product_repository.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    products = ProductRepositoryImpl();
    cart = CartRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final ProductRepository products;
  late final CartRepository cart;
}
