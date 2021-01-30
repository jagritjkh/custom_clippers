import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class MultipleRoundedPointsClipper extends CustomClipper<Path> {
  final double heightOfPoint;
  final int numberOfPoints;
  final Sides side;

  MultipleRoundedPointsClipper(this.side,
      {this.heightOfPoint = 12, this.numberOfPoints = 16}); // final Sides side;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    double x = 0;
    double y = size.height;
    double yControlPoint = size.height - heightOfPoint;
    double increment = size.width / numberOfPoints;

    if (side == Sides.BOTTOM || side == Sides.VERTICAL)
      while (x < size.width) {
        path.quadraticBezierTo(
            x + increment / 2, yControlPoint, x + increment, y);
        x += increment;
      }

    path.lineTo(size.width, 0.0);

    if (side == Sides.VERTICAL)
      while (x > 0) {
        path.quadraticBezierTo(
            x - increment / 2, heightOfPoint, x - increment, 0);
        x -= increment;
      }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
