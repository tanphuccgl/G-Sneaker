import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/utils/my_images.dart';
import 'package:g_sneaker/utils/page_routers.dart';
import 'package:badges/badges.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
        builder: (context, CartState state) {
      return Stack(
        children: [
          Badge(
            badgeContent:
                state.count > 0 ? Text('${state.count}') : const Text(""),
            child: IconButton(
              onPressed: () => PageRoutes.showCartScreen(context),
              icon: Image.asset(MyImage.cartIcon),
              iconSize: 24,
            ),
          ),
        ],
      );
    });
  }
}
