part of 'package:custom_clippers/custom_clippers.dart';

/// [Sides] is the enum which has two values and tells about the side.
/// [Sides.top] is for the top side.
/// [Sides.bottom] is for the bottom side.
/// [Sides.right] is for the right side.
/// [Sides.left] is for the left side.
/// [Sides.vertical] is for the bottom and top sides.
/// [Sides.horizontal] is for the right and left sides.
enum Sides { top, bottom, right, left, vertical, horizontal }

/// [MessageType] is the enum has two values and tells about the type of the
/// message.
/// [MessageType.send] is when the message is sent by you.
/// [MessageType.receive] is when the message is received by you.
enum MessageType { send, receive }

/// [VerticalPosition] is the enum which has two values and tells about the
/// vertical position.
/// [VerticalPosition.top] is for the top side.
/// [VerticalPosition.bottom] is for the bottom side.
enum VerticalPosition { top, bottom }

/// [HorizontalPosition] is the enum which has two values and tells about the
/// horizontal position.
/// [HorizontalPosition.left] is for the left side.
/// [HorizontalPosition.right] is for the right side.
enum HorizontalPosition { left, right }
