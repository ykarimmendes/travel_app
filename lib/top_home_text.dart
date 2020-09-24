import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_buttom.dart';

class TopHomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20),
      width: 400,
      child: Text(
        "Atrações em Destaque",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

