import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/product/product_cubit.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/wigets/background.dart';
import 'package:g_sneaker/ui/wigets/out_products/product_card.dart';
import 'package:g_sneaker/ui/wigets/your_cart/cart_icon_button.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

class OurProductsPage extends StatelessWidget {
  static const String routeName = "/OurProductsPage";

  const OurProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width / 15;
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final shoesList = state.items ?? [];
          return Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: CustomPaint(painter: CirclePainter()),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(padding, 20, padding, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image: const AssetImage(MyImage.nikeIcon),
                                  height: size.width / 6,
                                  width: size.width / 6,
                                ),
                                const CartIconButton(),
                              ],
                            ),
                            Text(
                              "Our Products",
                              style: TextStyle(
                                  color: MyColors.blackColor,
                                  fontSize: size.width / 13,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              shoes: shoesList[index],
                            );
                          },
                          itemCount: shoesList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 32,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
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
