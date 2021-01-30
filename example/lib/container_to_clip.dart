import 'package:flutter/material.dart';

class ContainerToClip extends StatelessWidget {
  final Color color;
  final String text;

  ContainerToClip(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
