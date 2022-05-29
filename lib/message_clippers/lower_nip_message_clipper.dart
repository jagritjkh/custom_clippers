part of 'package:custom_clippers/custom_clippers.dart';

/// [LowerNipMessageClipper] is the clipper which extends the [CustomClipper]
/// and clips the container's all four corners but one of the bottom
/// corners is nipped.
///
/// [MessageType] is the parameter which decides the type of message
/// [MessageType.send] for sender or [MessageType.receive] for receiver.
///
/// [bubbleRadius] is the parameter which decides the radius of the bubble
/// container.
/// Default value of bubble radius is [16].
///
/// [sizeOfNip] is the parameter which decides the size of the nip.
/// Default value of bubble radius is [8].
///
/// [sizeRatio] is the parameter which decides the size ratio of the nip.
/// Default value of bubble radius is [4].
///
/// The [getClip] method is called whenever the custom clip needs to be updated.
///
/// The [shouldReclip] method is called when a new instance of the class
/// is provided, to check if the new instance actually represents different
/// information.
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

    if (type == MessageType.send) {
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
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
