import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_buttom.dart';

class StoriesHomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 20,
              child: Text(
                "Stories for Blumenau",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            height: 30,
            child: CButton(
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

