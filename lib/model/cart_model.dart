import 'dart:convert';

import 'package:g_sneaker/model/shoes_model.dart';

import '../main.dart';

class CartModel {
  static void saveCartLocal({
    List<Shoes>? shoesList,
    List<int>? numberOfShoesList,
    List<bool>? statusList,
  }) {
    String jsonShoesList = jsonEncode(shoesList);
    prefs?.setString('shoesList', jsonShoesList);

    String jsonStatusList = jsonEncode(statusList);
    prefs?.setString('statusList', jsonStatusList);

    String jsonNumberOfShoesList = jsonEncode(numberOfShoesList);
    prefs?.setString('numberOfShoesList', jsonNumberOfShoesList);
  }

  static double totalPrice({
    double? total,
    List<Shoes>? shoesList,
    List<int>? numberOfShoesList,
  }) {
    for (int i = 0; i < shoesList!.length; i++) {
      for (int j = 0; j < numberOfShoesList!.length; j++) {
        if (i == j) {
          total = total! + shoesList[i].price! * numberOfShoesList[j];
        }
      }
    }
    return total!;
  }
}
