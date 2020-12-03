import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/model/photo.dart';
import 'package:travelapp/widgets/custom_text.dart';

class PhotoAttractionPage extends StatefulWidget {
  final Photo _photo;

  PhotoAttractionPage(this._photo);

  @override
  _PhotoAttractionPageState createState() => _PhotoAttractionPageState();
}

class _PhotoAttractionPageState extends State<PhotoAttractionPage> {
  @override
  Widget build(BuildContext context) {
    final Photo _photo = widget._photo;
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(242, 241, 243, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 50,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Image.network(
                    _photo.url,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: CText(
                text: "Créditos",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 167, 86, 1),
              ),
            ),
            Expanded(
              flex: 25,
              child: ListTile(
                leading: Material(
                  color: Colors.grey[350],
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  shape: CircleBorder(),
                  child: Container(
                    width: 50,
                    height: 50,
                    //child: Image.asset("assets/avatar_w.jpg"),
                  ),
                ),
                title: Text("Ingrid Leonel"),
                subtitle: Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                  ],
                ),
                trailing: CText(
                  text: "Ver Perfil",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 25,
              child: Row(
                children: <Widget>[
                  Text("Facebook"),
                  Text("Facebook"),
                  Text("Facebook")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
