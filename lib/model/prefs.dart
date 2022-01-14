import 'dart:convert';

import 'package:g_sneaker/model/shoes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Prefs {
  static late SharedPreferences _prefs;
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveCartLocal({
    List<Shoes>? shoesList,
  }) {
    String jsonShoesList = jsonEncode(shoesList);
    _prefs.setString('shoesList', jsonShoesList);
  }

  static List<Shoes> loadCart() {}

  // static double totalPrice({
  //   double? total,
  //   List<Shoes>? shoesList,
  //   List<int>? numberOfShoesList,
  // }) {
  //   for (int i = 0; i < shoesList!.length; i++) {
  //     for (int j = 0; j < numberOfShoesList!.length; j++) {
  //       if (i == j) {
  //         total = total! + shoesList[i].price! * numberOfShoesList[j];
  //       }
  //     }
  //   }
  //   return total!;
  // }
}
