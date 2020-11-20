import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant{

  final String title;
  final String type;
  final String image;
  final List<String> sub;
  final DocumentReference reference;

  Restaurant.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Restaurant.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        type = map['type'],
        image = map['image'],
        sub = List.from(map['sub']);

}