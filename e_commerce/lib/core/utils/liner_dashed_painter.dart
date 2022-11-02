import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {
  final Color color;

  LineDashedPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2
      ..color = color;
    var max = 35;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
