import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/ui/wigets/background.dart';
import 'package:g_sneaker/ui/wigets/your_cart/header_cart.dart';
import 'package:g_sneaker/ui/wigets/your_cart/item_cart_widget.dart';
import 'package:g_sneaker/utils/my_colors.dart';

class YourCartPage extends StatelessWidget {
  const YourCartPage({Key? key}) : super(key: key);
  static const String routeName = "/YourCartPage";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width / 15;

    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final shoesList = state.items ?? [];
          return Stack(
            children: [
              SizedBox(
                  width: size.width,
                  height: size.height,
                  child: CustomPaint(
                    painter: CirclePainter(),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(padding, 20, padding, 0),
                child: Column(
                  children: [
                    HeaderCart(
                      total: state.totalPrice(shoesList),
                    ),
                    shoesList.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ItemCartWidget(
                                  shoes: shoesList[index],
                                  quantily: shoesList[index].count ?? -1,
                                );
                              },
                              itemCount: shoesList.length,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: size.width / 15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Your cart is empty.",
                                style: TextStyle(
                                    color: MyColors.blackColor,
                                    fontSize: size.width / 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
