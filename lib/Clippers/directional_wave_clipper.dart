import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class DirectionalWaveClipper extends CustomClipper<Path> {
  final VerticalPosition verticalPosition;
  final HorizontalPosition horizontalPosition;

  DirectionalWaveClipper({
    this.verticalPosition = VerticalPosition.BOTTOM,
    this.horizontalPosition = HorizontalPosition.LEFT,
  });

  @override
  Path getClip(Size size) {
    var path = Path();
    var firstControlPoint;
    var firstEndPoint;
    var secondControlPoint;
    var secondEndPoint;
    if (verticalPosition == VerticalPosition.BOTTOM &&
        horizontalPosition == HorizontalPosition.LEFT) {
      firstEndPoint = Offset(size.width * .5, size.height - 20);
      firstControlPoint = Offset(size.width * .25, size.height - 30);
      secondEndPoint = Offset(size.width, size.height - 50);
      secondControlPoint = Offset(size.width * .75, size.height - 10);

      path
        ..lineTo(0.0, size.height)
        ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
            firstEndPoint.dx, firstEndPoint.dy)
        ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
            secondEndPoint.dx, secondEndPoint.dy)
        ..lineTo(size.width, 0.0)
        ..close();
    } else if (verticalPosition == VerticalPosition.BOTTOM &&
        horizontalPosition == HorizontalPosition.RIGHT) {
      firstEndPoint = Offset(size.width * .5, size.height - 20);
      firstControlPoint = Offset(size.width * .25, size.height - 10);
      secondEndPoint = Offset(size.width, size.height);
      secondControlPoint = Offset(size.width * .75, size.height - 30);

      path
        ..lineTo(0.0, size.height - 30)
        ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
            firstEndPoint.dx, firstEndPoint.dy)
        ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
            secondEndPoint.dx, secondEndPoint.dy)
        ..lineTo(size.width, 0.0)
        ..close();
    } else if (verticalPosition == VerticalPosition.TOP &&
        horizontalPosition == HorizontalPosition.RIGHT) {
      firstEndPoint = Offset(size.width * .5, 20);
      firstControlPoint = Offset(size.width * .25, 10);
      secondEndPoint = Offset(size.width, 0);
      secondControlPoint = Offset(size.width * .75, 30);

      path
        ..lineTo(0, 30)
        ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
            firstEndPoint.dx, firstEndPoint.dy)
        ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
            secondEndPoint.dx, secondEndPoint.dy)
        ..lineTo(size.width, size.height)
        ..lineTo(0.0, size.height)
        ..close();
    } else {
      firstEndPoint = Offset(size.width * .5, 20);
      firstControlPoint = Offset(size.width * .25, 30);
      secondEndPoint = Offset(size.width, 50);
      secondControlPoint = Offset(size.width * .75, 10);

      path
        ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
            firstEndPoint.dx, firstEndPoint.dy)
        ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
            secondEndPoint.dx, secondEndPoint.dy)
        ..lineTo(size.width, size.height)
        ..lineTo(0.0, size.height)
        ..close();
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
