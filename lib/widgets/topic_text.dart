import 'package:flutter/material.dart';

import 'custom_text.dart';

class TopicText extends StatelessWidget {
  final String text;

  TopicText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: CText(
        text: text,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(54, 71, 88, 1),
        fontSize: 16,
        fontFamily: "Acme",
      ),
    );
  }
}
