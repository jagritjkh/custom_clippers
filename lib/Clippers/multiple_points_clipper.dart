import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class MultiplePointsClipper extends CustomClipper<Path> {
  final double heightOfPoint;
  final int numberOfPoints;
  final Sides side;

  MultiplePointsClipper(this.side,
      {this.heightOfPoint = 12, this.numberOfPoints = 16});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0.0;
    double y = size.height;
    double increment = size.width / numberOfPoints / 2;

    if (side == Sides.BOTTOM || side == Sides.VERTICAL)
      while (x < size.width) {
        x += increment;
        y = (y == size.height) ? size.height - heightOfPoint : size.height;
        path.lineTo(x, y);
      }
    path.lineTo(size.width, 0.0);

    x = size.width;
    y = 0.0;
    if (side == Sides.VERTICAL)
      while (x > 0) {
        x -= increment;
        y = (y == 0) ? 0 + heightOfPoint : 0;
        path.lineTo(x, y);
      }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
