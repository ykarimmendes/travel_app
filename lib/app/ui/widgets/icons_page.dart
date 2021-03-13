import 'package:flutter/material.dart';

import 'custom_text.dart';

class IconPage extends StatelessWidget {
  final IconData icon;
  final String text;
  Color iconColor;
  Color textColor;
  VoidCallback voidCallback;

  IconPage({@required this.text, @required this.icon, this.iconColor, this.textColor, this.voidCallback});

  @override
  Widget build(BuildContext context) {
    if (iconColor == null) iconColor = Colors.grey[500];

    return Column(
      children: <Widget>[
        IconButton(
          onPressed: voidCallback,
          icon: Icon(icon, color: iconColor,),
        ),
        SizedBox(
          height: 15,
        ),
        CText(
          text: text,
          fontSize: 15,
          fontFamily: "LibreBaskerville",
          color: textColor,
        ),
      ],
    );
  }
}