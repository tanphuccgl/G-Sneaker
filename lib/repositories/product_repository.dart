import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:g_sneaker/model/shoes_model.dart';

abstract class ProductRepository {
  Future<List<Shoes>> fetchProduct();
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Shoes>> fetchProduct() {
    // TODO
    return Future.delayed(
      const Duration(seconds: 0),
      () async {
        final String response =
            await rootBundle.loadString('assets/shoes.json');
        final data = json.decode(response);
        List<Shoes> list =
            List<Shoes>.from(data['shoes'].map((e) => Shoes.fromJson(e)));
        return list;
      },
    );
  }
}

class NetworkException implements Exception {}
