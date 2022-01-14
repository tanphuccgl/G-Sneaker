import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:g_sneaker/model/shoes_model.dart';

abstract class ProductRepository {
  Future<List<Shoes>> fetchProduct();
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Shoes>> fetchProduct() {
    return Future.delayed(
      const Duration(seconds: 1),
      () async {
        final String response =
            await rootBundle.loadString('assets/shoes.json');
        final data = json.decode(response);
        return data['shoes'].map((e) => Shoes.fromJson(e)).toList();
      },
    );
  }
}

class NetworkException implements Exception {}
