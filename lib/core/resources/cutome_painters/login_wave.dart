import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2000000);
    path_0.lineTo(size.width * 0.03333333, size.height * 0.2665625);
    path_0.cubicTo(
        size.width * 0.06666667,
        size.height * 0.3343750,
        size.width * 0.1333333,
        size.height * 0.4656250,
        size.width * 0.2000000,
        size.height * 0.5165625);
    path_0.cubicTo(
        size.width * 0.2666667,
        size.height * 0.5656250,
        size.width * 0.3333333,
        size.height * 0.5343750,
        size.width * 0.4000000,
        size.height * 0.4500000);
    path_0.cubicTo(
        size.width * 0.4666667,
        size.height * 0.3656250,
        size.width * 0.5333333,
        size.height * 0.2343750,
        size.width * 0.6000000,
        size.height * 0.1665625);
    path_0.cubicTo(
        size.width * 0.6666667,
        size.height * 0.1000000,
        size.width * 0.7333333,
        size.height * 0.1000000,
        size.width * 0.8000000,
        size.height * 0.2334375);
    path_0.cubicTo(
        size.width * 0.8666667,
        size.height * 0.3656250,
        size.width * 0.9333333,
        size.height * 0.6343750,
        size.width * 0.9666667,
        size.height * 0.7665625);
    path_0.lineTo(size.width, size.height * 0.9000000);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.9666667, 0);
    path_0.cubicTo(size.width * 0.9333333, 0, size.width * 0.8666667, 0,
        size.width * 0.8000000, 0);
    path_0.cubicTo(size.width * 0.7333333, 0, size.width * 0.6666667, 0,
        size.width * 0.6000000, 0);
    path_0.cubicTo(size.width * 0.5333333, 0, size.width * 0.4666667, 0,
        size.width * 0.4000000, 0);
    path_0.cubicTo(size.width * 0.3333333, 0, size.width * 0.2666667, 0,
        size.width * 0.2000000, 0);
    path_0.cubicTo(size.width * 0.1333333, 0, size.width * 0.06666667, 0,
        size.width * 0.03333333, 0);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff0099ff).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
