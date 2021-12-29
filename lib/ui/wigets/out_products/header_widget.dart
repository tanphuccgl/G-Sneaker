import 'package:flutter/cupertino.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

Widget headerWidget({BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width,
    height: size.width / 3.7,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(nikeIcon),
          height: size.width / 6,
          width: size.width / 6,
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
