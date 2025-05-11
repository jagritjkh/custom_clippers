part of 'package:custom_clippers/custom_clippers.dart';

/// [TicketPassClipper] is the clipper which extends the [CustomClipper]
/// and clips the container in the shape of ticket or pass.
///
/// [position] is the parameter which decides the position of the clip.
/// Default value of position is [width of the container - 16.0].
///
/// [holeRadius] is the parameter which decides the radius of the hole.
/// Default value of radius of hole is [16].
///
/// The [getClip] method is called whenever the custom clip needs to be updated.
///
/// The [shouldReclip] method is called when a new instance of the class
/// is provided, to check if the new instance actually represents different
/// information.
class TicketPassClipper extends CustomClipper<Path> {
  TicketPassClipper({this.position, this.holeRadius = 16});

  double? position;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    position ??= size.width - 16;
    if (position! > size.width) {
      throw Exception('position is greater than width.');
    }
    final path =
        Path()
          ..moveTo(0, 0)
          ..lineTo(position! - holeRadius, 0.0)
          ..arcToPoint(
            Offset(position!, 0),
            clockwise: false,
            radius: const Radius.circular(1),
          )
          ..lineTo(size.width, 0.0)
          ..lineTo(size.width, size.height)
          ..lineTo(position!, size.height)
          ..arcToPoint(
            Offset(position! - holeRadius, size.height),
            clockwise: false,
            radius: const Radius.circular(1),
          );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
