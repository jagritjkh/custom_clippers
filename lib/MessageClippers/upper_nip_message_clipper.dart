import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class UpperNipMessageClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double sizeOfNip;
  final double sizeRatio;

  UpperNipMessageClipper(this.type,
      {this.bubbleRadius = 16, this.sizeOfNip = 8, this.sizeRatio = 4});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.SEND) {
      path.moveTo(bubbleRadius, sizeOfNip);
      path.lineTo(size.width - sizeOfNip * sizeRatio, sizeOfNip);

      path.quadraticBezierTo(size.width - sizeOfNip, sizeOfNip, size.width, 0);
      path.quadraticBezierTo(size.width - sizeOfNip, sizeOfNip,
          size.width - sizeOfNip, sizeRatio * sizeOfNip);

      path.lineTo(size.width - sizeOfNip, size.height - bubbleRadius);
      path.arcToPoint(
          Offset(size.width - sizeOfNip - bubbleRadius, size.height),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(bubbleRadius, size.height);
      path.arcToPoint(Offset(0, size.height - bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(0, bubbleRadius + sizeOfNip);
      path.arcToPoint(Offset(bubbleRadius, sizeOfNip),
          radius: Radius.circular(bubbleRadius));
    } else {
      path.quadraticBezierTo(
          sizeOfNip, sizeOfNip, sizeRatio * sizeOfNip, sizeOfNip);
      path.lineTo(size.width - bubbleRadius, sizeOfNip);
      path.arcToPoint(Offset(size.width, sizeOfNip + bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(size.width, size.height - bubbleRadius);
      path.arcToPoint(Offset(size.width - bubbleRadius, size.height),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(sizeOfNip + bubbleRadius, size.height);
      path.arcToPoint(Offset(sizeOfNip, size.height - bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(sizeOfNip, sizeRatio * sizeOfNip);
      path.quadraticBezierTo(sizeOfNip, sizeOfNip, 0, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
