import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/ui/wigets/out_products/header_widget.dart';
import 'package:g_sneaker/ui/wigets/out_products/product_card.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';
import 'package:animations/animations.dart';

class OurProductsPage extends StatefulWidget {
  static const String routeName = "/OurProductsPage";

  const OurProductsPage({Key? key}) : super(key: key);

  @override
  _OurProductsPageState createState() => _OurProductsPageState();
}

class _OurProductsPageState extends State<OurProductsPage> {
  List<Shoes> shoesList = [];
  List<Shoes> shoesCart = [];
  bool? isAddProduct;
  List<bool>? statusList;
  List<int>? numberOfShoesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
              top: -150,
              left: -250,
              child: Container(
                height: size.width,
                width: size.width,
                decoration: BoxDecoration(
                    color: yellowColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(size.width))),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.width / 20,
                ),
                headerWidget(
                    context: context,
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YourCartPage(
                                    shoesList: shoesList,
                                    statusList: statusList,
                                    numberOfShoesList: numberOfShoesList,
                                  )));
                      statusList = result;
                      setState(() {});

                    }),
                Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                      return true;
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          shoes: shoesList[index],
                          onPressed: () {
                            statusList![index] = true;
                            if (statusList![index] == true) {
                              numberOfShoesList?[index] = 1;
                            }

                            setState(() {});
                          },
                          isAddProduct: statusList![index],
                        );
                      },
                      itemCount: shoesList.length,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/shoes.json');
    final data = ShoesModel.fromJson(json.decode(response));
    if (data != null) {
      shoesList = (data.shoes!);
      statusList = List.generate(shoesList.length, (index) => false);
      numberOfShoesList = List.generate(shoesList.length, (index) {
        return 0;
      });
      setState(() {});
    }
  }
}