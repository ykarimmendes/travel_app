import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/home/restaurants/restaurant.dart';
import 'package:travelapp/restaurants/restaurant_page.dart';

class RestaurantsHomeCards extends StatelessWidget {
  const RestaurantsHomeCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('business').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.docs);
      },
    );
  }
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: snapshot.map((e) => _buildListItem(context, e)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final restaurant = Restaurant.fromSnapshot(data);
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RestaurantPage()),
      );
    },
    child: Card(
      elevation: 3,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Image.asset(
                    "assets/${restaurant.image}",
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  clipBehavior: Clip.antiAlias,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: Text(
                    restaurant.title,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ),
                ListTile(
                  isThreeLine: true,
                  dense: true,
                  title: Text(restaurant.type),
                  subtitle: Text(restaurant.sub.join(' , ')),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
