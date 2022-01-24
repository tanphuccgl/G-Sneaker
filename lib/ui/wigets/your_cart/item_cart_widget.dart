import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_sneaker/cubit/cart/cart_cubit.dart';
import 'package:g_sneaker/model/shoes_model.dart';
import 'package:g_sneaker/ui/wigets/your_cart/icon_circle_button.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';
import 'package:hexcolor/hexcolor.dart';

const errorImage =
    "https://banner2.cleanpng.com/20180421/ggq/kisspng-computer-icons-error-closeup-vector-5adbcf14c17ba4.4222143315243548367925.jpg";

class ItemCartWidget extends StatelessWidget {
  const ItemCartWidget({
    Key? key,
    required this.quantily,
    required this.shoes,
  }) : super(key: key);
  final int quantily;
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context1, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: size.width / 6),
          child: SizedBox(
            width: size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _image(context,
                    color: shoes.color ?? "#e1e7ed",
                    image: shoes.image ?? errorImage),
                _info(
                  context,
                  title: shoes.name ?? "N/A",
                  price: shoes.price ?? -1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bottom(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width / 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 3.3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconCircleButton(
                    icon: MyImage.minusIcon,
                    onPressed: () {
                      context.read<CartCubit>().decreaseNumber(shoes);
                    }),
                Text(
                  quantily.toString(),
                  style: TextStyle(
                      color: MyColors.blackColor,
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.normal),
                ),
                IconCircleButton(
                    icon: MyImage.plusIcon,
                    onPressed: () {
                      context.read<CartCubit>().increaseNumber(shoes);
                    })
              ],
            ),
          ),
          IconCircleButton(
              icon: MyImage.trashIcon,
              color: MyColors.yellowColor,
              size: 22,
              onPressed: () {
                context.read<CartCubit>().removeItem(shoes);
              })
        ],
      ),
    );
  }

  Widget _image(BuildContext context,
      {required String color, required String image}) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3,
      height: size.width / 3,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: size.width / 4,
              height: size.width / 4,
              decoration: BoxDecoration(
                color: HexColor(color),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: -18,
            child: SizedBox(
              width: size.width / 3,
              height: size.width / 3,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-28 / 360),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: size.width / 1,
                  width: size.width / 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _info(
    BuildContext context, {
    required String title,
    required double price,
  }) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width / 3,
      width: size.width - size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                color: MyColors.blackColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "\$$price",
            style: const TextStyle(
              color: MyColors.blackColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          _bottom(
            context,
          ),
        ],
      ),
    );
  }
}
