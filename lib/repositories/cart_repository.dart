import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:g_sneaker/model/shoes_model.dart';

abstract class CartRepository {
  Future<List<Shoes>> fetchCart(List<Shoes> list);
}

class CartRepositoryImpl implements CartRepository {
  @override
  Future<List<Shoes>> fetchCart(List<Shoes> list) {
    return Future.delayed(
      const Duration(seconds: 1),
      () async {
        return list.where((e) => e.isContent == true).toList();
      },
    );
  }
}

class NetworkException implements Exception {}
