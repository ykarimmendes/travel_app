import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[100],
      ),
    );
    return AppBar(
      flexibleSpace: Container(
        height: 100,
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Card(
          shadowColor: Colors.grey,
          elevation: 5,
          child: TextField(
            autofocus: false,
            cursorColor: Colors.black,
            style: TextStyle(
              height: 1.5,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(1),
              prefixIcon: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              hintText: "Text",
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
            ),
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
