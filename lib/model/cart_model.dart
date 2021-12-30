import 'dart:convert';

import 'package:g_sneaker/model/shoes_model.dart';

import '../main.dart';

class CartModel {
  static void saveCartLocal({
    double? total,
    List<Shoes>? shoesList,
    List<int>? numberOfShoesList,
    List<bool>? statusList,
  }) {
    prefs?.setDouble("total", total!);

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

  static List? getCartLocal({
    double? total,
    List<Shoes>? shoesList,
    List<int>? numberOfShoesList,
    List<bool>? statusList,
  }) {


    if (prefs?.getString('statusList') != null) {
      final String? temp = prefs?.getString('statusList');
      List list = jsonDecode(temp!);
      statusList = list.cast<bool>();
      return statusList;
    }
    if (prefs?.getString('numberOfShoesList') != null) {
      final String? temp = prefs?.getString('numberOfShoesList');
      List list = jsonDecode(temp!);
      numberOfShoesList = list.cast<int>();
      return numberOfShoesList;
    }
    if (prefs?.getString('shoesList') != null) {
      final String? temp = prefs?.getString('shoesList');
      List<Shoes> list =
          (json.decode(temp!) as List).map((i) => Shoes.fromJson(i)).toList();
      shoesList = list.cast<Shoes>();
      return shoesList;
    }
  }
}
