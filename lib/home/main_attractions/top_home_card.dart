import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/top_attractions/main_attraction.dart';

import 'attraction.dart';

class TopHomeCard extends StatelessWidget {
  const TopHomeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('attractions').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.docs);
      },
    );
  }
}
Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return SizedBox(
    height: 260,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    ),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final att = Attraction.fromSnapshot(data);
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainAttractions()),
      );
    },
    child: SizedBox(
      width: 280.0,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                height: 150,
                width: 260,
                child: Card(
                  elevation: 5,
                  child: Image.asset(
                    "assets/${att.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Text(
                att.title,
                style:
                TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 10, right: 8),
              child: Text(
                  att.resume),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Text(
                "Top #${att.top} Museus",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

}