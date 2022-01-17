import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/cubit/cart/cart_state.dart';
import 'package:g_sneaker/cubit/product/product_cubit.dart';
import 'package:g_sneaker/model/prefs.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/ui/wigets/background.dart';
import 'package:g_sneaker/ui/wigets/out_products/product_card.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

class OurProductsPage extends StatefulWidget {
  static const String routeName = "/OurProductsPage";

  const OurProductsPage({Key? key}) : super(key: key);

  @override
  _OurProductsPageState createState() => _OurProductsPageState();
}

class _OurProductsPageState extends State<OurProductsPage> {
  late List<Shoes> shoesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //  Prefs?.init().clear();

    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
              shoesList = state.shoes;

              return SizedBox(
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
                          SizedBox(
                            width: size.width,
                            height: size.width / 3.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage(nikeIcon),
                                      height: size.width / 6,
                                      width: size.width / 6,
                                    ),
                                    Stack(
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            List<Shoes> result =
                                                await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            YourCartPage(
                                                                shoesList:
                                                                    shoesList)));

                                            shoesList = result;
                                            setState(() {});
                                          },
                                          icon: Image.asset(cartIcon),
                                          iconSize: size.width / 10,
                                        ),
                                        BlocProvider(
                                            create: (context) =>
                                                CartCubit(shoesList),
                                            child: BlocBuilder<CartCubit,
                                                CartState>(
                                              builder: (context, state) {
                                                CartCubit(shoesList)
                                                    .getCart(shoesList);

                                                return state.items != null
                                                    ? Text(
                                                        "${totalShoes(shoesList: state.items!)}")
                                                    : const Text("321");
                                              },
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "Our Products",
                                  style: TextStyle(
                                      fontFamily: "Rubik",
                                      color: blackColor,
                                      fontSize: size.width / 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
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
                                      shoesList[index].isContent = true;
                                      shoesList[index].count = 1;

                                      setState(() {});
                                    },
                                    isAddProduct: shoesList[index].isContent,
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
              );
            } else if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductError) {
              return const Center(
                child: Icon(Icons.close),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  int totalShoes({required List<Shoes> shoesList}) {
    int total = 0;
    for (int i = 0; i < shoesList.length; i++) {
      total = total + int.parse(shoesList[i].count.toString());
    }
    return total;
  }
}
