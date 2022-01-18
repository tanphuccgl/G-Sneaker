import 'dart:convert';

import 'package:g_sneaker/model/shoes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveCartLocal({
    List<Shoes>? shoesList,
  }) {
    String jsonShoesList = jsonEncode(shoesList);
    _prefs.setString('shoesList1', jsonShoesList);
  }

  static List<Shoes> loadCart() {
    final String? temp = _prefs.getString('shoesList1');
    if (temp != null) {
      List<Shoes> list =
          (json.decode(temp) as List).map((i) => Shoes.fromJson(i)).toList();
      return list.cast<Shoes>();
    }
    return [];
  }
}
