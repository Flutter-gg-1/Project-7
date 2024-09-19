import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TuwaiqLogoCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(105.376, 0.670942);
    path_0.cubicTo(115.566, 0.587116, 147.384, -1.92151, 154.887, 3.33569);
    path_0.cubicTo(166.811, 11.6918, 158.375, 48.058, 161.179, 61.8782);
    path_0.cubicTo(161.7, 64.4475, 162.705, 66.9796, 164.977, 68.3454);
    path_0.cubicTo(176.732, 75.4103, 208.599, 63.7669, 225.056, 74.945);
    path_0.cubicTo(230.416, 93.5532, 223.716, 120.042, 229.427, 135.697);
    path_0.cubicTo(234.505, 142.92, 272.188, 138.727, 282.206, 140.242);
    path_0.cubicTo(285.189, 140.694, 288.158, 142.091, 290.909, 143.338);
    path_0.cubicTo(291.911, 145.687, 292.783, 148.375, 293.28, 150.898);
    path_0.cubicTo(295.439, 161.847, 296.473, 195.851, 290.77, 204.698);
    path_0.cubicTo(288.763, 207.81, 286.133, 209.337, 282.639, 209.999);
    path_0.cubicTo(273.452, 211.741, 237.088, 212.443, 230.292, 207.401);
    path_0.cubicTo(221.622, 200.969, 227.697, 161.745, 225.561, 150.033);
    path_0.cubicTo(221.93, 130.13, 176.301, 147.306, 163.067, 137.864);
    path_0.cubicTo(156.565, 130.336, 159.198, 104.637, 159.266, 94.4211);
    path_0.cubicTo(159.36, 89.7326, 160.065, 83.0761, 158.314, 78.7333);
    path_0.cubicTo(157.156, 75.8652, 155.076, 73.3216, 152.268, 72.1603);
    path_0.cubicTo(145.265, 69.2648, 107.676, 70.0673, 100.654, 73.3181);
    path_0.cubicTo(88.015, 79.1705, 98.6584, 131.745, 93.0002, 145.619);
    path_0.cubicTo(90.3705, 152.066, 15.1209, 215.694, 7.40146, 219);
    path_0.cubicTo(5.85879, 218.578, 5.22442, 218.353, 4.16736, 217.034);
    path_0.cubicTo(-1.96231, 209.385, 0.221402, 164.018, 1.13442, 152.719);
    path_0.cubicTo(10.3722, 137.628, 48.3393, 107.783, 63.2206, 95.5151);
    path_0.cubicTo(71.7523, 88.481, 82.0536, 81.1681, 88.1294, 71.6546);
    path_0.cubicTo(98.91, 54.7752, 86.1182, 17.8264, 95.8313, 4.90147);
    path_0.cubicTo(98.327, 1.58034, 101.628, 1.19236, 105.376, 0.670942);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 1.088786, size.height * 0.9978082),
        Offset(size.width * 0.1094495, size.height * 0.9978082), [
      const Color(0xff4D2DB3).withOpacity(0.5),
      const Color(0xffA380FF).withOpacity(0.5),
      const Color(0xff5CE3D9).withOpacity(0.5)
    ], [
      0,
      0.535,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}