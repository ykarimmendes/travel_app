import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/attractions/attraction.dart';

class AttractionAll extends StatefulWidget {
  @override
  _AttractionAllState createState() => _AttractionAllState();
}

class _AttractionAllState extends State<AttractionAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Lugares em Blumenau",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(246, 246, 246, 1),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('attractions')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return LinearProgressIndicator();
                  return buildListView(context, snapshot.data.docs);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListView(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: snapshot.map((e) => _buildSizedBox(context, e)).toList(),
    );
  }

  SizedBox _buildSizedBox(BuildContext context, DocumentSnapshot data) {
    final attraction = Attraction.fromSnapshot(data);
    return SizedBox(
      height: 135,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AttractionAll()),
          );
        },
        child: Card(
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network(
                          attraction.photoCoverThumb,
                          fit: BoxFit.cover,
                          width: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Museu da Água",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17),
                      ),
                      StatsLocation(),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          "Museu dedicado à história do tratamento da água na cidade, em ponto com mirante coberto e vista panorâmica.",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 50),
                        child: Text(
                          "5.95 Km de distância",
                          style: TextStyle(fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatsLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
      ],
    );
  }
}
