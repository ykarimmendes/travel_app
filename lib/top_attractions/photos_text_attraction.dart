import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_text.dart';

class PhotosTextLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: CText(
        text: "Fotos",
        fontWeight: FontWeight.w900,
        fontSize: 17,
        fontFamily: "LibreBaskerville",
      ),
    );
  }
}