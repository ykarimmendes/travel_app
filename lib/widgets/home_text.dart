import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_buttom.dart';

class HomeText extends StatelessWidget {
  final String text;
  final bool renderMore;
  final double top;

  HomeText({@required this.text, this.renderMore = true, this.top = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: top, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 20,
              child: Text(
                text,
                style: TextStyle(fontSize: 20),
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
                  ),
          ),
        ],
      ),
    );
  }
}
