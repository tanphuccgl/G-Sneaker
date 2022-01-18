import 'package:flutter/material.dart';
import 'package:g_sneaker/utils/my_images.dart';

class IconCircleButton extends StatelessWidget {
  const IconCircleButton(
      {Key? key,
      required this.icon,
      this.color,
      this.onPressed,
      this.size = 18})
      : super(key: key);
  final String icon;
  final Color? color;
  final double size;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.grey.shade300,
      ),
      alignment: Alignment.center,
      width: 32,
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          icon,
          width: size,
        ),
      ),
    );
  }
}
