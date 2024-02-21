import 'package:flutter/material.dart';

class TCustomCurvedEdge extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondCurve = Offset(0, size.height - 20);
    final endCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        secondCurve.dx, secondCurve.dy, endCurve.dx, endCurve.dy);

    final thirdCurve = Offset(size.width, size.height - 20);
    final lastEndCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
        thirdCurve.dx, thirdCurve.dy, lastEndCurve.dx, lastEndCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
