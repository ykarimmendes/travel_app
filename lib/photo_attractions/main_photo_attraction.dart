import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_text.dart';

class MainPhotoAttraction extends StatefulWidget {
  final int _photoId;

  MainPhotoAttraction(this._photoId);

  @override
  _MainPhotoAttractionState createState() =>
      _MainPhotoAttractionState(_photoId);
}

class _MainPhotoAttractionState extends State<MainPhotoAttraction> {
  final int _photoId;

  _MainPhotoAttractionState(this._photoId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.indigo,
                Colors.blue,

              ],
            )
          ),
        ),
        title: CText(
          text: "Museu da Água",
          color: Colors.white,
          fontFamily: "LibreBaskerville",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
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
                    return Image.asset(
                      "assets/museu/m$_photoId.jpg",
                      fit: BoxFit.contain,
                    );
                  },),
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
                title: Text("Ingrid Leonel de Souza"),
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
