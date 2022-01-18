import 'package:g_sneaker/model/prefs.dart';
import 'package:g_sneaker/model/shoes_model.dart';

abstract class CartRepository {
  Future<List<Shoes>> fetchCart();
  Future<List<Shoes>> saveCart(List<Shoes> items);
}

class CartRepositoryImpl implements CartRepository {
  @override
  Future<List<Shoes>> fetchCart() async {
    await Future.delayed(const Duration(seconds: 1));
    return Prefs.loadCart();
  }

  @override
  Future<List<Shoes>> saveCart(List<Shoes> items) {
    // TODO: implement saveCart
    throw UnimplementedError();
  }
}

class NetworkException implements Exception {}
