import 'package:flutter/material.dart';

class PhotosLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 12),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 7,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Image.asset(
            "assets/museu/m$index.jpg",
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}