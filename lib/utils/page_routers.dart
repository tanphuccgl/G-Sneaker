import 'package:flutter/material.dart';
import 'package:g_sneaker/ui/pages/our_products_page.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';

class PageRoutes {
  static const String ourProductsPage = OurProductsPage.routeName;
  static const String yourCartPage = YourCartPage.routeName;

  static showCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(yourCartPage);
  }
}
