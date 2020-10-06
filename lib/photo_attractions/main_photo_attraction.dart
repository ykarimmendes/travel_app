import 'package:flutter/material.dart';

class MainPhotoAttraction extends StatefulWidget {
  @override
  _MainPhotoAttractionState createState() => _MainPhotoAttractionState();
}

class _MainPhotoAttractionState extends State<MainPhotoAttraction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      "assets/museu/m0.jpg",
                    );
                  }),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
