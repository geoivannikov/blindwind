import 'package:flutter/material.dart';
import 'package:blindwind/constants/background_painter_constants.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.width;

    Paint _loginPagePaint = Paint()..style = PaintingStyle.fill;

    Path _loginPageBackground = Path()
      ..addRect(Rect.fromLTRB(0, 0, size.width, size.height))
      ..close();

    _loginPagePaint.color = LOGIN_PAGE_WHITE_COLOR;
    canvas.drawPath(_loginPageBackground, _loginPagePaint);

    Path _loginPageDesignBottom = Path()
      ..moveTo(width, 4.5 * height / 5)
      ..quadraticBezierTo(
          2.8 * width / 4, 4.2 * height / 5, 3.8 * width / 7, 9 * height / 15)
      ..lineTo(0, 0)
      ..lineTo(width, 0)
      ..close();

    _loginPagePaint.color = LOGIN_PAGE_BLUE_COLOR;
    canvas.drawPath(_loginPageDesignBottom, _loginPagePaint);

    Path _loginPageDesignMiddle = Path()
      ..moveTo(width, 2.3 * height / 15)
      ..cubicTo(width, 4 * height / 15, 2 * width / 3, height / 4,
          4.2 * width / 7, 9 * height / 15)
      ..quadraticBezierTo(width / 2, 14 * height / 15, 0, 11 * height / 15)
      ..lineTo(0, 0)
      ..lineTo(width, 0)
      ..close();

    _loginPagePaint.color = LOGIN_PAGE_BLACK_COLOR;
    canvas.drawPath(_loginPageDesignMiddle, _loginPagePaint);

    Path _loginPageDesignTop = Path()
      ..moveTo(5 * width / 7, 0)
      ..quadraticBezierTo(
          9 * width / 14, height / 30, 4 * width / 7, height / 30)
      ..quadraticBezierTo(
          width / 8, height / 13, 1.3 * width / 7, 3.95 * height / 15)
      ..quadraticBezierTo(1.3 * width / 4, height / 2, 0, 7 * height / 15)
      ..lineTo(0, 0)
      ..close();

    _loginPagePaint.color = LOGIN_PAGE_YELLOW_COLOR;
    canvas.drawPath(_loginPageDesignTop, _loginPagePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}