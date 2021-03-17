import 'package:flutter/material.dart';

class TicketPassClipper extends CustomClipper<Path> {
  TicketPassClipper({this.position, this.holeRadius = 16});

  double? position;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    if (position == null) position = size.width - 16;
    if (position! > size.width)
      throw Exception('position is greater than width.');
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(position! - holeRadius, 0.0)
      ..arcToPoint(
        Offset(position!, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(position!, size.height)
      ..arcToPoint(
        Offset(position! - holeRadius, size.height),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
