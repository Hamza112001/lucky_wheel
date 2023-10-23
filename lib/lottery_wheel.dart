import 'dart:math';

import 'package:flutter/material.dart';

class MyLotteryWheelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List myList = ['CAR', 'CAR', 'CAR', 'CAR', 'CAR', 'CAR'];
    final width = size.width;
    final height = size.height;
    const noOfRotation = 6;
    const angle = 2 * pi / noOfRotation;

    final radius = min(width, height) / 2;
    final centreOffset = Offset(width, height) / 2;

    final circlePaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 20;

    canvas.drawCircle(centreOffset, radius, circlePaint);
    canvas.drawCircle(
        centreOffset, radius * 0.1, Paint()..color = Colors.white);
    canvas.save();
    canvas.translate(radius, radius);

    for (var i = 0; i < noOfRotation; i++) {
      canvas.drawLine(
          const Offset(0, 0),
          Offset(width / 2, radius * 0.01),
          Paint()
            ..color = Colors.white
            ..strokeWidth = 3);

      TextPainter textPainter = TextPainter();
      textPainter.textDirection = TextDirection.ltr;
      textPainter.text = TextSpan(
          text: myList[i],
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white));
      textPainter.layout();
      textPainter.paint(canvas, Offset(width / 2 - 200, radius * 0.01 - 150));
      canvas.rotate(angle);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(MyLotteryWheelPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyLotteryWheelPainter oldDelegate) => false;
}
