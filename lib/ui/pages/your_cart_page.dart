import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_sneaker/model/prefs.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/wigets/background.dart';
import 'package:g_sneaker/ui/wigets/your_cart/header_cart.dart';
import 'package:g_sneaker/ui/wigets/your_cart/item_cart_widget.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'dart:convert';

import '../../main.dart';

class YourCartPage extends StatefulWidget {
  final List<int>? numberOfShoesList;
  final List<Shoes>? shoesList;
  final List<bool>? statusList;
  static const String routeName = "/YourCartPage";

  const YourCartPage(
      {Key? key, this.numberOfShoesList, this.shoesList, this.statusList})
      : super(key: key);

  @override
  _YourCartPageState createState() => _YourCartPageState();
}

class _YourCartPageState extends State<YourCartPage> {
  List<Shoes>? shoesList;
  double? total = 0;
  List<int>? numberOfShoesList;
  List<bool>? statusList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shoesList = widget.shoesList;
    numberOfShoesList = widget.numberOfShoesList;
    statusList = widget.statusList;

    if (prefs?.getString('statusList') != null) {
      final String? temp = prefs?.getString('statusList');
      List list = jsonDecode(temp!);
      statusList = list.cast<bool>();
    }

    if (prefs?.getString('numberOfShoesList') != null) {
      final String? temp = prefs?.getString('numberOfShoesList');
      List list = jsonDecode(temp!);
      numberOfShoesList = list.cast<int>();
    } else {
      numberOfShoesList;
    }

    if (prefs?.getString('shoesList') != null) {
      final String? temp = prefs?.getString('shoesList');
      List<Shoes> list =
          (json.decode(temp!) as List).map((i) => Shoes.fromJson(i)).toList();
      shoesList = list.cast<Shoes>();
    }
    total = CartModel.totalPrice(
        total: total,
        numberOfShoesList: numberOfShoesList,
        shoesList: shoesList);
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
          background(context: context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.width / 20,
                ),
                headerCartWidget(
                    context: context,
                    total: total,
                    onPressed: () {
                      Navigator.pop(context, [statusList, numberOfShoesList]);
                    }),
                statusList!.contains(true)
                    ? Expanded(
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return true;
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return numberOfShoesList![index] <= 0
                                  ? const SizedBox.shrink()
                                  : ItemCartWidget(
                                      shoes: shoesList![index],
                                      quantily: numberOfShoesList![index],
                                      onMinus: () {
                                        numberOfShoesList![index]--;
                                        total =
                                            total! - shoesList![index].price!;

                                        if (numberOfShoesList![index] <= 0) {
                                          statusList?[index] = false;
                                        }
                                        CartModel.saveCartLocal(
                                            shoesList: shoesList,
                                            numberOfShoesList:
                                                numberOfShoesList,
                                            statusList: statusList);
                                        setState(() {});
                                      },
                                      onPlus: () {
                                        numberOfShoesList![index]++;
                                        total =
                                            total! + shoesList![index].price!;
                                        CartModel.saveCartLocal(
                                            shoesList: shoesList,
                                            numberOfShoesList:
                                                numberOfShoesList,
                                            statusList: statusList);
                                        setState(() {});
                                      },
                                      onTrash: () {
                                        total = total! -
                                            shoesList![index].price! *
                                                numberOfShoesList![index];
                                        numberOfShoesList![index] = 0;
                                        statusList?[index] = false;
                                        CartModel.saveCartLocal(
                                            shoesList: shoesList,
                                            numberOfShoesList:
                                                numberOfShoesList,
                                            statusList: statusList);
                                        setState(() {});
                                      },
                                    );
                            },
                            itemCount: shoesList!.length,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: size.width / 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Your cart is empty.",
                            style: TextStyle(
                                fontFamily: "Rubik",
                                color: blackColor,
                                fontSize: size.width / 20,
                                fontWeight: FontWeight.normal),
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
}
