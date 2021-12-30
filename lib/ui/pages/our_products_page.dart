import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_sneaker/main.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/ui/wigets/background.dart';
import 'package:g_sneaker/ui/wigets/out_products/header_widget.dart';
import 'package:g_sneaker/ui/wigets/out_products/product_card.dart';
import 'package:g_sneaker/utils/my_colors.dart';

class OurProductsPage extends StatefulWidget {
  static const String routeName = "/OurProductsPage";

  const OurProductsPage({Key? key}) : super(key: key);

  @override
  _OurProductsPageState createState() => _OurProductsPageState();
}

class _OurProductsPageState extends State<OurProductsPage> {
  List<Shoes> shoesList = [];
  bool? isAddProduct;
  List<bool>? statusList;
  List<int>? numberOfShoesList;
  int? index1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   //  prefs?.clear();

    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          background(context: context),
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
                      List result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YourCartPage(
                                    shoesList: shoesList,
                                    statusList: statusList,
                                    numberOfShoesList: numberOfShoesList,
                                  )));
                      print(result.first);
                      statusList = result.first;
                      numberOfShoesList=result[1];
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
                        if (prefs?.getString('statusList') != null) {
                          final String? musicsString =
                              prefs?.getString('statusList');

                          List musics = jsonDecode(musicsString!);
                          statusList = musics.cast<bool>();
                        }

                        return ProductCard(
                          shoes: shoesList[index],
                          onPressed: () {

                              statusList![index] = true;
                              if (statusList![index] == true
                                 ) {

                                numberOfShoesList?[index] = 1;
                              }
                              String jsonShoesList = jsonEncode(shoesList);

                              prefs?.setString('shoesList', jsonShoesList);

                              ///23
                              String jsonShoesList1 = jsonEncode(statusList);

                              prefs?.setString('statusList', jsonShoesList1);

                              ///
                              String jsonShoesList2 =
                                  jsonEncode(numberOfShoesList);

                              prefs?.setString(
                                  'numberOfShoesList', jsonShoesList2);

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

  void naviYourCart() async {}

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/shoes.json');
    final data = ShoesModel.fromJson(json.decode(response));
    if (data != null) {
      shoesList = (data.shoes!);
      statusList = List.generate(shoesList.length, (index) => false);
      numberOfShoesList = List.generate(shoesList.length, (index) => index = 0);
      setState(() {});
    }
  }
}
