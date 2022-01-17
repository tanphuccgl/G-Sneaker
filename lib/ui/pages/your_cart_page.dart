import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/cubit/cart/cart_state.dart';
import 'package:g_sneaker/model/prefs.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/pages/our_products_page.dart';
import 'package:g_sneaker/ui/wigets/background.dart';
import 'package:g_sneaker/ui/wigets/your_cart/header_cart.dart';
import 'package:g_sneaker/ui/wigets/your_cart/item_cart_widget.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'dart:convert';

import '../../main.dart';

class YourCartPage extends StatefulWidget {
  final List<Shoes>? shoesList;
  static const String routeName = "/YourCartPage";

  const YourCartPage({
    Key? key,
    this.shoesList,
  }) : super(key: key);

  @override
  _YourCartPageState createState() => _YourCartPageState();
}

class _YourCartPageState extends State<YourCartPage> {
  late List<Shoes> shoesList;
  double total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    shoesList = widget.shoesList!;
    total = _totalPrice(total: total, shoesList: shoesList);
    return BlocProvider(
      create: (context) => CartCubit(widget.shoesList!),
      child: Scaffold(
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {

            if(state.items != null)
              {
                for(var item in state.items!)
                  {
                    print("123 ${item.name}");
                  }
                return state.items != null
                    ? Scaffold(
                    body: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Stack(
                        children: [
                          background(context: context),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: size.width / 15),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.width / 20,
                                ),
                                headerCartWidget(
                                    context: context,
                                    total: total,
                                    onPressed: () {
                                      Navigator.pop(context, widget.shoesList);
                                    }),
                                state.items!.isNotEmpty
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
                                        return ItemCartWidget(
                                          shoes: state.items![index],
                                          quantily:
                                          state.items![index].count,
                                          onMinus: () {
                                            state.items![index].count =
                                                state.items![index].count! -
                                                    1;
                                            total = total -
                                                state.items![index].price!;
                                            if (state
                                                .items![index].count! <=
                                                0) {
                                              state.items![index]
                                                  .isContent = false;
                                              state.items!.removeAt(index);
                                            }

                                            setState(() {});
                                          },
                                          onPlus: () {
                                            state.items![index].count =
                                                state.items![index].count! +
                                                    1;
                                            total = total +
                                                state.items![index].price!;

                                            setState(() {});
                                          },
                                          onTrash: () {
                                            total = total -
                                                state.items![index].price! *
                                                    state.items![index]
                                                        .count!
                                                        .toDouble();

                                            state.items![index].isContent =
                                            false;
                                            shoesList[index].isContent =
                                            false;

                                            state.items!.remove(
                                                state.items![index]);
                                            setState(() {
                                             
                                            });
                                          },
                                        );
                                      },
                                      itemCount: state.items!.length,
                                    ),
                                  ),
                                )
                                    : Padding(
                                  padding:
                                  EdgeInsets.only(top: size.width / 15),
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
                    ))
                    : const Center(
                  child: CircularProgressIndicator(),
                );
              }return Container();

          },
        ),
      ),
    );
  }

  static double _totalPrice(
      {required double total, required List<Shoes> shoesList}) {
    total = 0;

    for (int i = 0; i < shoesList.length; i++) {
      if (shoesList[i].isContent == true) {
        total = total +
            double.parse(shoesList[i].count.toString()) *
                shoesList[i].price!.toDouble();
      }
    }
    return total;
  }
}
