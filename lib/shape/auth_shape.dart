import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AuthShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(91.9756, 118.946);
    path_0.cubicTo(54.6807, 117.406, 45.3404, 74.8318, 8.04627, 73.2746);
    path_0.cubicTo(4.51657, 73.1272, -1, 73.2746, -1, 73.2746);
    path_0.lineTo(-1, 0);
    path_0.lineTo(390, 0);
    path_0.cubicTo(390, 0, 364.049, 43.327, 337.733, 59.7238);
    path_0.cubicTo(289.777, 89.6039, 247.09, 43.3626, 192.992, 59.7238);
    path_0.cubicTo(149.211, 72.9649, 137.682, 120.832, 91.9756, 118.946);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3910256, size.height * -9.663866),
        Offset(size.width * 0.4159974, size.height * 1.269050), [
      const Color(0xff9B37FF).withOpacity(1),
      const Color(0xff7721d1).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
