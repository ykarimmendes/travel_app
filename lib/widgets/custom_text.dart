import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CText extends StatelessWidget {

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final int maxLines;
  final double height;
  final  TextAlign textAlign;

  CText({@required this.text, this.color = Colors.black, this.fontWeight = FontWeight.normal, this.fontSize = 15.0, this.fontFamily = "", this.maxLines = 99, this.height = 1, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textAlign,
      maxLines: maxLines,
      style: TextStyle(
        decoration: TextDecoration.none,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: height,
          fontFamily: fontFamily),
    );
  }
}