import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sneaker/ui/pages/your_cart_page.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

Widget headerWidget({BuildContext? context,Function()? onPressed}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width,
    height: size.width / 3.7,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(nikeIcon),
              height: size.width / 6,
              width: size.width / 6,
            ),
            IconButton(
              onPressed: onPressed,
              icon: Image.asset(cartIcon),
              iconSize: size.width / 10,
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
  );
}
