import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {

  HomeText(this._text);
  String _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20, bottom: 15),
      width: 400,
      child: Text(
        _text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

