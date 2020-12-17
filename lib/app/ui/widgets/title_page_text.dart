import 'package:flutter/material.dart';
import 'package:travelapp/app/ui/theme/utils.dart';

import 'custom_text.dart';

class TitlePageText extends StatelessWidget {

  final String _text;
    TitlePageText(this._text);

  @override
  Widget build(BuildContext context) {
    return CText(
        text: _text,
        fontSize: 22,
        fontFamily: "LibreBaskerville",
        fontWeight: FontWeight.w900,
        color: Util.topText);
  }
}
