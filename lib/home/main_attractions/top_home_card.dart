import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/attractions/attraction.dart';
import 'package:travelapp/attractions/attraction_page.dart';
import 'package:travelapp/widgets/card_text.dart';
import 'package:travelapp/widgets/card_title.dart';

class TopHomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collectionGroup('attractions').snapshots(),
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
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttractionPage(att),
          ));
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
                  child: Image.network(
                    att.photoCoverThumb,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: CardTitle(att.title),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 10, right: 8),
              child: CardText(att.resume),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Top #${att.top} Museus",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
