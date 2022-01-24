import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({Key? key, required this.total}) : super(key: key);
  final double total;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.width / 3.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(MyImage.nikeIcon),
            iconSize: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Cart",
                style: TextStyle(
                    color: MyColors.blackColor,
                    fontSize: size.width / 13,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                total <= 0.0
                    ? "\$0.00"
                    : "\$${double.parse(total.toStringAsFixed(2))}",
                style: const TextStyle(
                    fontSize: 28,
                    color: MyColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
