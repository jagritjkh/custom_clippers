part of 'package:custom_clippers/custom_clippers.dart';

class ThreeRoundedEdgesMessageClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double fourthEdgeRadius;

  ThreeRoundedEdgesMessageClipper(
    this.type, {
    this.bubbleRadius = 30,
    this.fourthEdgeRadius = 2,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.send) {
      path.addRRect(
        RRect.fromLTRBR(
          0,
          0,
          size.width,
          size.height,
          Radius.circular(bubbleRadius),
        ),
      );
      var path2 = Path();
      path2.addRRect(
        RRect.fromLTRBAndCorners(
          0,
          0,
          bubbleRadius,
          bubbleRadius,
          bottomRight: Radius.circular(fourthEdgeRadius),
        ),
      );
      path.addPath(
        path2,
        Offset(size.width - bubbleRadius, size.height - bubbleRadius),
      );
    } else {
      path.addRRect(
        RRect.fromLTRBR(
          0,
          0,
          size.width,
          size.height,
          Radius.circular(bubbleRadius),
        ),
      );
      var path2 = Path();
      path2.addRRect(
        RRect.fromLTRBAndCorners(
          0,
          0,
          bubbleRadius,
          bubbleRadius,
          bottomLeft: Radius.circular(fourthEdgeRadius),
        ),
      );
      path.addPath(path2, const Offset(0, 0));
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
