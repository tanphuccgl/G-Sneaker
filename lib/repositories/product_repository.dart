import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:g_sneaker/model/shoes_model.dart';

abstract class ProductRepository {
  Future<ShoesModel> fetchProduct();
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<ShoesModel> fetchProduct() {
    // TODO: implement fetchProduct
    return Future.delayed(
      const Duration(seconds: 1),
      () async {
        final String response =
            await rootBundle.loadString('assets/shoes.json');
        final data = ShoesModel.fromJson(json.decode(response));
        return data;
      },
    );
  }
}

class NetworkException implements Exception {}
