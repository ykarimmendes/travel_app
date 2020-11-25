import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final String _text;

  CardText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontFamily: "CreteRound"),
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: 3,
    );
  }
}
