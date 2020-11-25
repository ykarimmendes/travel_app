import 'package:flutter/cupertino.dart';

class CardTitle extends StatelessWidget {

  final String _text;

  CardTitle(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontFamily: "Acme", fontSize: 17),
    );
  }
}
