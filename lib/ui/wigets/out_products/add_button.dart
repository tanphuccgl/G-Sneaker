import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sneaker/utils/my_colors.dart';
import 'package:g_sneaker/utils/my_images.dart';

Widget addButton({BuildContext? context, Function()? onPressed}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    height: size.width / 7,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: yellowColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width / 10),
            // side: BorderSide(color: Colors.red)
          )),
      child: Text(
        "ADD TO CARD",
        style: TextStyle(
            color: blackColor,
            fontFamily: "Rubik",
            fontSize: size.width / 20,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget checkMarkIcon({
  BuildContext? context,
}) {
  Size size = MediaQuery.of(context!).size;
  return Container(
    height: size.width / 7,
    width: size.width / 7,
    decoration: BoxDecoration(
      color: yellowColor,
      borderRadius: BorderRadius.all(Radius.circular(size.width / 10)),
    ),
    child: Center(
      child: Image.asset(
        checkIcon,
        alignment: Alignment.center,
        height: size.width / 15,
        width: size.width / 15,
      ),
    ),
  );
}
