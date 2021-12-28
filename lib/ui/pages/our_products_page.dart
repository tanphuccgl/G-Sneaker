import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OurProductsPage extends StatefulWidget {
  static const String routeName = "/OurProductsPage";

  const OurProductsPage({Key? key}) : super(key: key);

  @override
  _OurProductsPageState createState() => _OurProductsPageState();
}

class _OurProductsPageState extends State<OurProductsPage> {
  List _items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/shoes.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["shoes"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green,
    );
  }
}
