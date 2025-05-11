part of 'package:custom_clippers/custom_clippers.dart';

/// [MultiplePointsClipper] is the clipper which extends the [CustomClipper]
/// and clips the edge of the container in zig-zag shape.
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
class MultiplePointsClipper extends CustomClipper<Path> {
  final double heightOfPoint;
  final int numberOfPoints;
  final Sides side;

  MultiplePointsClipper(
    this.side, {
    this.heightOfPoint = 12,
    this.numberOfPoints = 16,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();
    double x = 0.0;
    double y = 0.0;
    double incrementHeight = size.height / numberOfPoints / 2;
    double incrementWidth = size.width / numberOfPoints / 2;

    if (side == Sides.left || side == Sides.horizontal) {
      while (y < size.height) {
        x = (x != heightOfPoint) ? heightOfPoint : 0;
        y += incrementHeight;
        path.lineTo(x, y);
      }
    }

    path.lineTo(0, size.height);

    if (side == Sides.top ||
        side == Sides.left ||
        side == Sides.right ||
        side == Sides.horizontal) {
      path.lineTo(size.width, size.height);
    }

    if (side == Sides.bottom || side == Sides.vertical) {
      x = 0.0;
      y = size.height;
      while (x < size.width) {
        x += incrementWidth;
        y = (y == size.height) ? size.height - heightOfPoint : size.height;
        path.lineTo(x, y);
      }
    }

    if (side == Sides.right || side == Sides.horizontal) {
      x = size.width;
      y = size.height;
      while (y > 0) {
        y -= incrementHeight;
        x = (x == size.width) ? size.width - heightOfPoint : size.width;
        path.lineTo(x, y);
      }
    }

    path.lineTo(size.width, 0.0);

    x = size.width;
    y = 0.0;
    if (side == Sides.top || side == Sides.vertical) {
      while (x > 0) {
        x -= incrementWidth;
        y = (y == 0) ? heightOfPoint : 0;
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
