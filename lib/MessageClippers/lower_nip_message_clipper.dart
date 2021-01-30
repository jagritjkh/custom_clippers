import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class LowerNipMessageClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double sizeOfNip;
  final double sizeRatio;

  LowerNipMessageClipper(this.type,
      {this.bubbleRadius = 16, this.sizeOfNip = 8, this.sizeRatio = 4});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.SEND) {
      path.lineTo(size.width - bubbleRadius - sizeOfNip, 0);
      path.arcToPoint(Offset(size.width - sizeOfNip, bubbleRadius),
          radius: Radius.circular(bubbleRadius));

      path.lineTo(size.width - sizeOfNip, size.height - sizeRatio * sizeOfNip);

      path.quadraticBezierTo(size.width - sizeOfNip, size.height - sizeOfNip,
          size.width, size.height);
      path.quadraticBezierTo(size.width - sizeOfNip, size.height - sizeOfNip,
          size.width - sizeRatio * sizeOfNip, size.height - sizeOfNip);

      path.lineTo(bubbleRadius, size.height - sizeOfNip);

      path.arcToPoint(Offset(0, size.height - bubbleRadius - sizeOfNip),
          radius: Radius.circular(bubbleRadius));

      path.lineTo(0, bubbleRadius);
      path.arcToPoint(Offset(bubbleRadius, 0),
          radius: Radius.circular(bubbleRadius));
    } else {
      path.lineTo(size.width - bubbleRadius, 0);
      path.arcToPoint(Offset(size.width, bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(size.width, size.height - bubbleRadius - sizeOfNip);
      path.arcToPoint(
          Offset(size.width - bubbleRadius, size.height - sizeOfNip),
          radius: Radius.circular(bubbleRadius));

      path.lineTo(sizeRatio * sizeOfNip, size.height - sizeOfNip);

      path.quadraticBezierTo(
          sizeOfNip, size.height - sizeOfNip, 0, size.height);
      path.quadraticBezierTo(sizeOfNip, size.height - sizeOfNip, sizeOfNip,
          size.height - sizeRatio * sizeOfNip);

      path.lineTo(sizeOfNip, bubbleRadius);
      path.arcToPoint(Offset(bubbleRadius + sizeOfNip, 0),
          radius: Radius.circular(bubbleRadius));
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
