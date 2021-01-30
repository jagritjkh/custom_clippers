import 'package:custom_clippers/enum/enums.dart';
import 'package:flutter/material.dart';

class ThreeRoundedEdgesMessageClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double fourthEdgeRadius;

  ThreeRoundedEdgesMessageClipper(this.type,
      {this.bubbleRadius = 30, this.fourthEdgeRadius = 2});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.SEND) {
      path.addRRect(RRect.fromLTRBR(
          0, 0, size.width, size.height, Radius.circular(bubbleRadius)));
      var path2 = Path();
      path2.addRRect(RRect.fromLTRBAndCorners(0, 0, bubbleRadius, bubbleRadius,
          bottomRight: Radius.circular(fourthEdgeRadius)));
      path.addPath(
          path2, Offset(size.width - bubbleRadius, size.height - bubbleRadius));
    } else {
      path.addRRect(RRect.fromLTRBR(
          0, 0, size.width, size.height, Radius.circular(bubbleRadius)));
      var path2 = Path();
      path2.addRRect(RRect.fromLTRBAndCorners(0, 0, bubbleRadius, bubbleRadius,
          topLeft: Radius.circular(fourthEdgeRadius)));
      path.addPath(path2, Offset(0, 0));
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => old != this;
}
