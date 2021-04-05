import 'dart:math';

import 'package:flutter/material.dart';

//draw Circle  using CustomPainter

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  double percent;
  final double width;

  RadialPainter({
    this.bgColor,
    this.lineColor,
    this.percent,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    percent == 0.0 ? percent = 1 : percent = percent;

    Paint bgLine = Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, bgLine);
    double sweepAngle = pi * 2 * (percent);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi * 0.5,
      sweepAngle,
      false,
      completeLine,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
