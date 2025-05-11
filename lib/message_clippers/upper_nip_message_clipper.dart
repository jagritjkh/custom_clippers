part of 'package:custom_clippers/custom_clippers.dart';

/// [UpperNipMessageClipper] is the clipper which extends the [CustomClipper]
/// and clips the container's all four corners but one of the top
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
class UpperNipMessageClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;
  final double sizeOfNip;
  final double sizeRatio;

  UpperNipMessageClipper(
    this.type, {
    this.bubbleRadius = 16,
    this.sizeOfNip = 8,
    this.sizeRatio = 4,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.send) {
      path.moveTo(bubbleRadius, sizeOfNip);
      path.lineTo(size.width - sizeOfNip * sizeRatio, sizeOfNip);

      path.quadraticBezierTo(size.width - sizeOfNip, sizeOfNip, size.width, 0);
      path.quadraticBezierTo(
        size.width - sizeOfNip,
        sizeOfNip,
        size.width - sizeOfNip,
        sizeRatio * sizeOfNip,
      );

      path.lineTo(size.width - sizeOfNip, size.height - bubbleRadius);
      path.arcToPoint(
        Offset(size.width - sizeOfNip - bubbleRadius, size.height),
        radius: Radius.circular(bubbleRadius),
      );
      path.lineTo(bubbleRadius, size.height);
      path.arcToPoint(Offset(0, size.height - bubbleRadius), radius: Radius.circular(bubbleRadius));
      path.lineTo(0, bubbleRadius + sizeOfNip);
      path.arcToPoint(Offset(bubbleRadius, sizeOfNip), radius: Radius.circular(bubbleRadius));
    } else {
      path.quadraticBezierTo(sizeOfNip, sizeOfNip, sizeRatio * sizeOfNip, sizeOfNip);
      path.lineTo(size.width - bubbleRadius, sizeOfNip);
      path.arcToPoint(
        Offset(size.width, sizeOfNip + bubbleRadius),
        radius: Radius.circular(bubbleRadius),
      );
      path.lineTo(size.width, size.height - bubbleRadius);
      path.arcToPoint(
        Offset(size.width - bubbleRadius, size.height),
        radius: Radius.circular(bubbleRadius),
      );
      path.lineTo(sizeOfNip + bubbleRadius, size.height);
      path.arcToPoint(
        Offset(sizeOfNip, size.height - bubbleRadius),
        radius: Radius.circular(bubbleRadius),
      );
      path.lineTo(sizeOfNip, sizeRatio * sizeOfNip);
      path.quadraticBezierTo(sizeOfNip, sizeOfNip, 0, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
