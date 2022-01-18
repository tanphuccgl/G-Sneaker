import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/cubit/cart/cart_state.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(this.item, {Key? key}) : super(key: key);
  final Shoes item;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      // TODO: AnimatedCrossFade
      if (state.isContent(item.id ?? 0)) {
        return checkMarkIcon(
          context: context,
        );
      }
      return addButton(
          context: context,
          onPressed: () {
            context.read<CartCubit>().addItem(item);
          });
    });
  }

  Widget addButton({BuildContext? context, Function()? onPressed}) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text("ADD TO CARD"),
      ),
    );
  }

  Widget checkMarkIcon({
    BuildContext? context,
  }) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: yellowColor,
        // borderRadius: BorderRadius.all(Radius.circular(size.width / 10)),
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Image.asset(
          checkIcon,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
