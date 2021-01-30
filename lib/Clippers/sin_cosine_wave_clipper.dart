import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class SinCosineWaveClipper extends CustomClipper<Path> {
  final VerticalPosition verticalPosition;
  final HorizontalPosition horizontalPosition;

  SinCosineWaveClipper({
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
      path.lineTo(0.0, size.height - 20);

      firstControlPoint = Offset(size.width / 4, size.height);
      firstEndPoint = Offset(size.width / 2, size.height - 40.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      secondControlPoint =
          Offset(size.width - (size.width / 3.25), size.height - 65);
      secondEndPoint = Offset(size.width, size.height - 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height - 40);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (verticalPosition == VerticalPosition.BOTTOM &&
        horizontalPosition == HorizontalPosition.RIGHT) {
      path.lineTo(0.0, size.height - 40);
      firstControlPoint = Offset(size.width / 3.25, size.height - 65);
      firstEndPoint = Offset(size.width / 2, size.height - 40);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      secondControlPoint = Offset(size.width / 1.25, size.height);
      secondEndPoint = Offset(size.width, size.height - 30);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height - 20);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (verticalPosition == VerticalPosition.TOP &&
        horizontalPosition == HorizontalPosition.RIGHT) {
      path.lineTo(0.0, 20);
      firstControlPoint = Offset(size.width / 3.25, 65);
      firstEndPoint = Offset(size.width / 2, 40);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      secondControlPoint = Offset(size.width / 1.25, 0);
      secondEndPoint = Offset(size.width, 30);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    } else {
      path.lineTo(0.0, 20);

      firstControlPoint = Offset(size.width / 4, 0.0);
      firstEndPoint = Offset(size.width / 2, 40.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      secondControlPoint = Offset(size.width - (size.width / 3.25), 65);
      secondEndPoint = Offset(size.width, 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
