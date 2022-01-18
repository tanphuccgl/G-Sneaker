import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/cubit/cart/cart_state.dart';
import 'package:g_sneaker/cubit/product/product_cubit.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/ui/wigets/background.dart';
import 'package:g_sneaker/ui/wigets/out_products/product_card.dart';
import 'package:g_sneaker/ui/wigets/your_cart/cart_icon_button.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';
import 'package:g_sneaker/utils/page_routers.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
        builder: (context, CartState state) {
      return Stack(
        children: [
          IconButton(
            onPressed: () => PageRoutes.showCartScreen(context),
            icon: Image.asset(cartIcon),
            iconSize: 24,
          ),
          // TODO
          if (state.count > 0) Text('${state.count}')
        ],
      );
    });
  }
}
