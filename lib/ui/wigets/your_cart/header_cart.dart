import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

Widget headerCartWidget(
    {required BuildContext context, double? total, Function()? onPressed}) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width,
    height: size.width / 3.7,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Image.asset(nikeIcon),
          iconSize: size.width / 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your Cart",
              style: TextStyle(
                  color: blackColor,
                  fontSize: size.width / 13,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              total! <= 0.0
                  ? "\$0.00"
                  : "\$${double.parse(total.toStringAsFixed(2))}",
              style: TextStyle(
                  color: blackColor,
                  fontSize: size.width / 13,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ),
  );
}
