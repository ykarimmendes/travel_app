import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  Color buttonColor;
  Color textColor;
  final Widget methodCall;

  CButton(
      {@required this.text,
      @required this.methodCall,
      this.buttonColor,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    if (buttonColor == null) buttonColor = Colors.grey[300];

    return Card(
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
            side: BorderSide(color: buttonColor)),
        color: buttonColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => methodCall),
          );
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 12, color: textColor),
        ),
      ),
    );
  }
}
