import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);
  String text;
  double fontSize;
  Color color;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
