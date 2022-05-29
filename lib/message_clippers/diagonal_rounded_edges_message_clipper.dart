part of 'package:custom_clippers/custom_clippers.dart';

/// [DiagonalRoundedEdgesMessageClipper] is the clipper which extends the
/// [CustomClipper] and clips the container's two corners based on message type.
///
/// [MessageType] is the parameter which decides the type of message
/// [MessageType.send] for sender or [MessageType.receive] for receiver.
///
/// [bubbleRadius] is the parameter which decides the radius of the bubble
/// container.
/// Default value of bubble radius is [30].
///
/// The [getClip] method is called whenever the custom clip needs to be updated.
///
/// The [shouldReclip] method is called when a new instance of the class
/// is provided, to check if the new instance actually represents different
/// information.
class DiagonalRoundedEdgesMessageClipper extends CustomClipper<Path> {
  final MessageType type;
  final double bubbleRadius;

  DiagonalRoundedEdgesMessageClipper(this.type, {this.bubbleRadius = 30});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (type == MessageType.send) {
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
  bool shouldReclip(CustomClipper oldClipper) => oldClipper != this;
}
