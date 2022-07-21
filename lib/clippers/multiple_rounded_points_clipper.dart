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

  MultipleRoundedPointsClipper(this.side, {this.heightOfPoint = 12, this.numberOfPoints = 16}); // final Sides side;

  @override
  Path getClip(Size size) {
    Path path = Path();
    double x = 0.0;
    double y = 0.0;
    double xControlPoint = size.width - heightOfPoint;
    double yControlPoint = size.height - heightOfPoint;
    double incrementHeight = size.height / numberOfPoints;
    double incrementWidth = size.width / numberOfPoints;

    if (side == Sides.left || side == Sides.horizontal) {
      while (y < size.height) {
        path.quadraticBezierTo(heightOfPoint, y + incrementHeight / 2, x, y + incrementHeight);
        y += incrementHeight;
      }
    }

    x = 0.0;
    y = size.height;
    path.lineTo(x, y);

    if (side == Sides.top || side == Sides.left || side == Sides.right || side == Sides.horizontal) {
      path.lineTo(size.width, size.height);
    }

    if (side == Sides.bottom || side == Sides.vertical) {
      while (x < size.width) {
        path.quadraticBezierTo(x + incrementWidth / 2, yControlPoint, x + incrementWidth, y);
        x += incrementWidth;
      }
    }

    x = size.width;

    if (side == Sides.right || side == Sides.horizontal) {
      while (y > 0) {
        path.quadraticBezierTo(xControlPoint, y - incrementHeight / 2, x, y - incrementHeight);
        y -= incrementHeight;
      }
    }

    path.lineTo(x, 0.0);

    if (side == Sides.top || side == Sides.vertical) {
      while (x > 0) {
        path.quadraticBezierTo(x - incrementWidth / 2, heightOfPoint, x - incrementWidth, 0);
        x -= incrementWidth;
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
