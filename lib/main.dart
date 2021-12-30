import 'package:flutter/material.dart';
import 'package:g_sneaker/ui/pages/our_products_page.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/utils/page_routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

SharedPreferences? prefs;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        PageRoutes.ourProductsPage: (context) => const OurProductsPage(),
        PageRoutes.yourCartPage: (context) => const YourCartPage(),
      },
      home: const OurProductsPage(),
    );
  }
}
