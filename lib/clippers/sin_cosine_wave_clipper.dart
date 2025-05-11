part of 'package:custom_clippers/custom_clippers.dart';

/// [SinCosineWaveClipper] is the clipper which extends the [CustomClipper]
/// and clips the container in the shape of the sine cosine wave.
///
/// [VerticalPosition] is the parameter which decides the vertical position
/// [VerticalPosition.top] or [VerticalPosition.bottom] from the the container
/// is to be clipped.
/// Default value of Vertical Position is [VerticalPosition.bottom]
///
/// [HorizontalPosition] is the parameter which decides the horizontal position
/// [HorizontalPosition.left] or [HorizontalPosition.right] from the the
/// container is be clipped.
/// Default value of Horizontal Position is [HorizontalPosition.left]
///
/// The [getClip] method is called whenever the custom clip needs to be updated.
///
/// The [shouldReclip] method is called when a new instance of the class
/// is provided, to check if the new instance actually represents different
/// information.
class SinCosineWaveClipper extends CustomClipper<Path> {
  final VerticalPosition verticalPosition;
  final HorizontalPosition horizontalPosition;

  SinCosineWaveClipper({
    this.verticalPosition = VerticalPosition.bottom,
    this.horizontalPosition = HorizontalPosition.left,
  });

  @override
  Path getClip(Size size) {
    var path = Path();
    Offset firstControlPoint;
    Offset firstEndPoint;
    Offset secondControlPoint;
    Offset secondEndPoint;
    if (verticalPosition == VerticalPosition.bottom &&
        horizontalPosition == HorizontalPosition.left) {
      path.lineTo(0.0, size.height - 20);

      firstControlPoint = Offset(size.width / 4, size.height);
      firstEndPoint = Offset(size.width / 2, size.height - 40.0);
      path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy,
      );

      secondControlPoint = Offset(
        size.width - (size.width / 3.25),
        size.height - 65,
      );
      secondEndPoint = Offset(size.width, size.height - 40);
      path.quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy,
      );

      path.lineTo(size.width, size.height - 40);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (verticalPosition == VerticalPosition.bottom &&
        horizontalPosition == HorizontalPosition.right) {
      path.lineTo(0.0, size.height - 40);
      firstControlPoint = Offset(size.width / 3.25, size.height - 65);
      firstEndPoint = Offset(size.width / 2, size.height - 40);
      path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy,
      );

      secondControlPoint = Offset(size.width / 1.25, size.height);
      secondEndPoint = Offset(size.width, size.height - 30);
      path.quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy,
      );

      path.lineTo(size.width, size.height - 20);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (verticalPosition == VerticalPosition.top &&
        horizontalPosition == HorizontalPosition.right) {
      path.lineTo(0.0, 20);
      firstControlPoint = Offset(size.width / 3.25, 65);
      firstEndPoint = Offset(size.width / 2, 40);
      path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy,
      );

      secondControlPoint = Offset(size.width / 1.25, 0);
      secondEndPoint = Offset(size.width, 30);
      path.quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy,
      );

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    } else {
      path.lineTo(0.0, 20);

      firstControlPoint = Offset(size.width / 4, 0.0);
      firstEndPoint = Offset(size.width / 2, 40.0);
      path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy,
      );

      secondControlPoint = Offset(size.width - (size.width / 3.25), 65);
      secondEndPoint = Offset(size.width, 40);
      path.quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy,
      );

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
