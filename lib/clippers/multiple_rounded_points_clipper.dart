part of 'package:custom_clippers/custom_clippers.dart';

/// [MultipleRoundedPointsClipper] is the clipper which extends the
/// [CustomClipper] and clips the edge of the container in circular points
/// shape.
///
/// [heightOfPoint] is the parameter which decides the height of the point.
/// Default value of height of point is [12.0].
///
/// [numberOfPoints] is the parameter which decides the number of points.
/// Default value of number of points is [16].
///
/// [Sides] is the parameter which decides the side of points [Sides.bottom] or
/// [Sides.vertical] on which side the container is to be clipped.
///
/// The [getClip] method is called whenever the custom clip needs to be updated.
///
/// The [shouldReclip] method is called when a new instance of the class
/// is provided, to check if the new instance actually represents different
/// information.
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

    if (side == Sides.bottom || side == Sides.vertical) {
      while (x < size.width) {
        path.quadraticBezierTo(
            x + increment / 2, yControlPoint, x + increment, y);
        x += increment;
      }
    }

    path.lineTo(size.width, 0.0);

    if (side == Sides.vertical) {
      while (x > 0) {
        path.quadraticBezierTo(
            x - increment / 2, heightOfPoint, x - increment, 0);
        x -= increment;
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
