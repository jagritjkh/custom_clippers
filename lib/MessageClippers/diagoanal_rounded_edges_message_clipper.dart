import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class ChatBubbleClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;

  ChatBubbleClipper(this.type, {this.bubbleRadius = 30});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.SEND) {
      path.addRRect(RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
          topLeft: Radius.circular(bubbleRadius),
          bottomRight: Radius.circular(bubbleRadius)));
    } else {
      path.addRRect(RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
          topRight: Radius.circular(bubbleRadius),
          bottomLeft: Radius.circular(bubbleRadius)));
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
