import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_sneaker/utils/my_colors.dart';

class CirclePainter extends CustomPainter {
  final Paint bluePaint = Paint()..color = MyColors.yellowColor;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTRB(-200, -200, size.width / 2.5, size.width / 1.8);

    final Path circle = Path()..addOval(rect);

    canvas.drawPath(circle, bluePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
