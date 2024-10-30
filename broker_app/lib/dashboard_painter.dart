import 'dart:math';
import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red // Color of the dashed border
      ..strokeWidth = 2 // Thickness of the border
      ..style = PaintingStyle.stroke;

    double radius = size.width / 2;
    double dashAngle = 20; // Length of each dash in degrees
    double gapAngle = 70; // Gap between each dash in degrees

    for (double startAngle = 0;
        startAngle < 360;
        startAngle += dashAngle + gapAngle) {
      double startRadians = startAngle * pi / 180;
      double endRadians = (startAngle + dashAngle) * pi / 180;

      final path = Path();
      path.addArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startRadians,
        endRadians - startRadians,
      );

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
