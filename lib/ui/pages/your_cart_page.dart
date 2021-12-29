import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/wigets/your_cart/header_cart.dart';
import 'package:g_sneaker/ui/wigets/your_cart/item_cart_widget.dart';
import 'package:g_sneaker/utils/my_colors.dart';

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
  double? total=0.00;
  List<int>? numberOfShoesList;
  List<bool>? statusList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shoesList = widget.shoesList;
    numberOfShoesList = widget.numberOfShoesList;
    statusList = widget.statusList;
     for(var item in shoesList!)
       {
         total = total! + item.price!;
       }
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
          // background
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
                headerCartWidget(
                    context: context,
                    total: total,
                    onPressed: () {
                      Navigator.pop(context, statusList);
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
                        return numberOfShoesList![index] <= 0
                            ? const SizedBox.shrink()
                            : ItemCartWidget(
                                shoes: shoesList![index],
                                quantily: numberOfShoesList![index],
                                onMinus: () {
                                  onMinus(
                                      price: shoesList![index].price,
                                      numberOfShoes: numberOfShoesList![index],
                                      status: statusList?[index]);
                                },
                                onPlus: () {
                                  onMinus(
                                      price: shoesList![index].price,
                                      numberOfShoes: numberOfShoesList![index],
                                      status: statusList?[index]);
                                },
                                onTrash: () {
                                  onTrash(
                                      price: shoesList![index].price,
                                      numberOfShoes: numberOfShoesList![index],
                                      status: statusList?[index]);
                                },
                              );
                      },
                      itemCount: shoesList!.length,
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

  void onMinus({int? numberOfShoes, double? price, bool? status}) {
    numberOfShoes = numberOfShoes! - 1;
    total = total! - price!;
    if (numberOfShoes <= 0) {
      status = false;
    }
    setState(() {});
  }

  void onPlus({int? numberOfShoes, double? price, bool? status}) {
    numberOfShoes = numberOfShoes! + 1;
    total = total! + price!;

    setState(() {});
  }

  void onTrash({int? numberOfShoes, double? price, bool? status}) {
    numberOfShoes = 0;
    total = total! + price!;
    status = false;
    setState(() {});
  }
}
