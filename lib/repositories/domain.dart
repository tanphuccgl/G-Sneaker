import 'package:g_sneaker/repositories/product_repository.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    products = ProductRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final ProductRepository products;
}
