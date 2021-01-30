import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class UpperNipMessageClipperTwo extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double nipHeight;
  final double nipWidth;
  final double nipRadius;

  UpperNipMessageClipperTwo({
    this.type = MessageType.SEND,
    this.bubbleRadius = 12,
    this.nipHeight = 12,
    this.nipWidth = 16,
    this.nipRadius = 2,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.SEND) {
      path.lineTo(size.width - nipRadius, 0);
      path.arcToPoint(Offset(size.width - nipRadius, nipRadius),
          radius: Radius.circular(nipRadius));
      path.lineTo(size.width - nipWidth, nipHeight);
      path.lineTo(size.width - nipWidth, size.height - bubbleRadius);
      path.arcToPoint(Offset(size.width - nipWidth - bubbleRadius, size.height),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(bubbleRadius, size.height);
      path.arcToPoint(Offset(0, size.height - bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(0, bubbleRadius);
      path.arcToPoint(Offset(bubbleRadius, 0),
          radius: Radius.circular(bubbleRadius));
    } else {
      path.lineTo(size.width - bubbleRadius, 0);
      path.arcToPoint(Offset(size.width, bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(size.width, size.height - bubbleRadius);
      path.arcToPoint(Offset(size.width - bubbleRadius, size.height),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(bubbleRadius + nipWidth, size.height);
      path.arcToPoint(Offset(nipWidth, size.height - bubbleRadius),
          radius: Radius.circular(bubbleRadius));
      path.lineTo(nipWidth, nipHeight);
      path.lineTo(nipRadius, nipRadius);
      path.arcToPoint(Offset(nipRadius, 0), radius: Radius.circular(nipRadius));
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
