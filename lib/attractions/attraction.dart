import 'package:cloud_firestore/cloud_firestore.dart';

class Attraction {
  String title;
  String resume;
  int top;
  String image;
  String topImage;
  String about;
  DocumentReference reference;

  Attraction.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Attraction.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        resume = map['resume'],
        top = map['top'],
        image = map['image'],
        about = map['about'],
        topImage = map['top_image'];
}
