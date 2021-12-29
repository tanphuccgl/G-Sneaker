import 'package:flutter/material.dart';
import 'package:g_sneaker/utils/my_images.dart';

Widget iconButton(
    {BuildContext? context,
    String? icon,
    Color? color,
    Function()? onPressed}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width / 11,
    height: size.width / 11,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 0,
          padding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width),
            // side: BorderSide(color: Colors.red)
          )),
      child: Image.asset(
        icon!,
        width: icon == trashIcon ? size.width / 18 : size.width / 26,
      ),
    ),
  );
}
