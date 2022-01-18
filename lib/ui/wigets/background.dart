import 'package:flutter/cupertino.dart';
import 'package:g_sneaker/utils/my_colors.dart';

// TODO refactor. user canvas and custom paint
Widget background({BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return Positioned(
    top: -150,
    left: -250,
    child: Container(
      height: size.width,
      width: size.width,
      decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.all(Radius.circular(size.width))),
    ),
  );
}
