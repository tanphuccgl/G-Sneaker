import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_sneaker/model/shoes_model.dart';
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
  double? total = 0.00;
  List<int>? numberOfShoesList;
  List<bool>? statusList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shoesList = widget.shoesList;
    numberOfShoesList = widget.numberOfShoesList;
    statusList = widget.statusList;
    if (prefs?.getDouble("total") != null) {
      total = prefs?.getDouble("total");
    }

    if (prefs?.getString('statusList') != null) {
      final String? musicsString = prefs?.getString('statusList');

      List musics = jsonDecode(musicsString!);

      statusList = musics.cast<bool>();
    }
    if (prefs?.getString('numberOfShoesList') != null) {
      final String? musicsString = prefs?.getString('numberOfShoesList');

      List musics = jsonDecode(musicsString!);

      numberOfShoesList = musics.cast<int>();
    }
    if (prefs?.getString('shoesList') != null) {
      final String? musicsString = prefs?.getString('shoesList');

      List<Shoes> musics = (json.decode(musicsString!) as List)
          .map((i) => Shoes.fromJson(i))
          .toList();

      shoesList = musics.cast<Shoes>();
    }
    for (int i = 0; i < shoesList!.length; i++) {
      for (int j = 0; j < numberOfShoesList!.length; j++) {
        if (i == j) {
          total = total! + shoesList![i].price! * numberOfShoesList![j];
        }
      }
    }
  }

  void saveCartLocal({double? total}) {
    prefs?.setDouble("total", total!);

    String jsonShoesList = jsonEncode(shoesList);

    prefs?.setString('shoesList', jsonShoesList);

    ///
    String jsonShoesList1 = jsonEncode(statusList);

    prefs?.setString('statusList', jsonShoesList1);

    ///
    String jsonShoesList2 = jsonEncode(numberOfShoesList);

    prefs?.setString('numberOfShoesList', jsonShoesList2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
print(numberOfShoesList);
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
                statusList!.contains(true)
                    ? Expanded(
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
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
                                        numberOfShoesList![index]--;
                                        total =
                                            total! - shoesList![index].price!;

                                        if (numberOfShoesList![index] <= 0) {
                                          statusList?[index] = false;

                                        }
                                        saveCartLocal(total: total);
                                        setState(() {});
                                      },
                                      onPlus: () {
                                        numberOfShoesList![index]++;
                                        total =
                                            total! + shoesList![index].price!;
                                        saveCartLocal(total: total);

                                        setState(() {});
                                      },
                                      onTrash: () {
                                        total = total! -
                                            shoesList![index].price! *
                                                numberOfShoesList![index];
                                        numberOfShoesList![index] = 0;

                                        statusList?[index] = false;
                                        saveCartLocal(total: total);
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
