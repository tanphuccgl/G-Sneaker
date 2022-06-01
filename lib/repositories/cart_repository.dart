import 'package:g_sneaker/model/prefs.dart';
import 'package:g_sneaker/model/shoes_model.dart';

abstract class CartRepository {
  Future<List<Shoes>> fetchCart();
  Future<void> saveCart(List<Shoes> items);
}

class CartRepositoryImpl implements CartRepository {
  @override
  Future<List<Shoes>> fetchCart() async {
    await Future.delayed(const Duration(seconds: 1));
    return Prefs.loadCart();
  }

  @override
  Future<void> saveCart(List<Shoes> items) async {
    Prefs.saveCartLocal(shoesList: items);
  }
}

class NetworkException implements Exception {}
