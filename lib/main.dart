import 'package:flutter/material.dart';
import 'package:g_sneaker/ui/pages/our_products_page.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/utils/page_routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),routes: {
      PageRoutes.ourProductsPage: (context) => const OurProductsPage(),
      PageRoutes.yourCartPage: (context) => const YourCartPage(),
    },
      home: const OurProductsPage(),
    );
  }
}

