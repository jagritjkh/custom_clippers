part of 'package:custom_clippers/custom_clippers.dart';

/// [DirectionalWaveClipper] is the clipper which extends the [CustomClipper]
/// and clips the container in the shape of the wave.
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
class DirectionalWaveClipper extends CustomClipper<Path> {
  final VerticalPosition verticalPosition;
  final HorizontalPosition horizontalPosition;

  DirectionalWaveClipper({
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
    } else if (verticalPosition == VerticalPosition.bottom &&
        horizontalPosition == HorizontalPosition.right) {
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
    } else if (verticalPosition == VerticalPosition.top &&
        horizontalPosition == HorizontalPosition.right) {
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
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
