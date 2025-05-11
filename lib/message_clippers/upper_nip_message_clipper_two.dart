part of 'package:custom_clippers/custom_clippers.dart';

/// [UpperNipMessageClipperTwo] is the clipper which extends the [CustomClipper]
/// and clips the container's all four corners but one of the top
/// corners is nipped.
///
/// [MessageType] is the parameter which decides the type of message
/// [MessageType.send] for sender or [MessageType.receive] for receiver.
///
/// [bubbleRadius] is the parameter which decides the radius of the bubble
/// container.
/// Default value of bubble radius is [12].
///
/// [nipHeight] is the parameter which decides the height of the nip.
/// Default value of bubble radius is [12].
///
/// [nipWidth] is the parameter which decides the width of the nip.
/// Default value of bubble radius is [16].
///
/// [nipRadius] is the parameter which decides the radius of the nip.
/// Default value of bubble radius is [16].
///
/// The [getClip] method is called whenever the custom clip needs to be updated.
///
/// The [shouldReclip] method is called when a new instance of the class
/// is provided, to check if the new instance actually represents different
/// information.
class UpperNipMessageClipperTwo extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double nipHeight;
  final double nipWidth;
  final double nipRadius;

  UpperNipMessageClipperTwo(
    this.type, {
    this.bubbleRadius = 12,
    this.nipHeight = 12,
    this.nipWidth = 16,
    this.nipRadius = 2,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.send) {
      path.lineTo(size.width - nipRadius, 0);
      path.arcToPoint(
        Offset(size.width - nipRadius, nipRadius),
        radius: Radius.circular(nipRadius),
      );
      path.lineTo(size.width - nipWidth, nipHeight);
      path.lineTo(size.width - nipWidth, size.height - bubbleRadius);
      path.arcToPoint(
        Offset(size.width - nipWidth - bubbleRadius, size.height),
        radius: Radius.circular(bubbleRadius),
      );
      path.lineTo(bubbleRadius, size.height);
      path.arcToPoint(Offset(0, size.height - bubbleRadius), radius: Radius.circular(bubbleRadius));
      path.lineTo(0, bubbleRadius);
      path.arcToPoint(Offset(bubbleRadius, 0), radius: Radius.circular(bubbleRadius));
    } else {
      path.lineTo(size.width - bubbleRadius, 0);
      path.arcToPoint(Offset(size.width, bubbleRadius), radius: Radius.circular(bubbleRadius));
      path.lineTo(size.width, size.height - bubbleRadius);
      path.arcToPoint(
        Offset(size.width - bubbleRadius, size.height),
        radius: Radius.circular(bubbleRadius),
      );
      path.lineTo(bubbleRadius + nipWidth, size.height);
      path.arcToPoint(
        Offset(nipWidth, size.height - bubbleRadius),
        radius: Radius.circular(bubbleRadius),
      );
      path.lineTo(nipWidth, nipHeight);
      path.lineTo(nipRadius, nipRadius);
      path.arcToPoint(Offset(nipRadius, 0), radius: Radius.circular(nipRadius));
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
