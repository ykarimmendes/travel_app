import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_buttom.dart';

class FilterHome extends StatelessWidget {
  var filters = ['Praças', 'Restaurantes', 'Parques', 'Bares', 'Família'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      height: 40,
      child: ListView.builder(
        itemCount: filters.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CButton(text: filters[index]);
        },
      ),
    );
  }
}
