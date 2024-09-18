import 'package:flutter/material.dart';

class bottomNavigationCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(-5, 0.696921);
    path_0.lineTo(107.515, 0.696921);
    path_0.cubicTo(107.515, 0.696921, 170.563, 0.696674, 180.896, 2.70982);
    path_0.cubicTo(191.229, 4.72296, 211.993, 32.2063, 224.622, 32.2063);
    path_0.cubicTo(237.251, 32.2063, 255.047, 7.23867, 270.546, 2.70982);
    path_0.cubicTo(286.046, -1.81903, 456, 0.696921, 456, 0.696921);
    path_0.lineTo(456, 48);
    path_0.lineTo(-5, 48);
    path_0.lineTo(-5, 0.696921);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff4E2EB5).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
