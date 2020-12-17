import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_buttom.dart';

class TitleText extends StatelessWidget {
  final String text;
  final bool renderMore;
  final double top;
  final Widget methodCallBack;

  TitleText({
    @required this.text,
    @required this.methodCallBack,
    this.renderMore = true,
    this.top = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 26,
              child: Text(
                text,
                style: TextStyle(fontSize: 20, fontFamily: "BreeSerif"),
              ),
            ),
          ),
          Container(
            height: 30,
            child: !renderMore
                ? Container()
                : CButton(
                    text: "Mais...",
                    buttonColor: Colors.grey[900],
                    textColor: Colors.white,
                    methodCall: methodCallBack,
                  ),
          ),
        ],
      ),
    );
  }
}
