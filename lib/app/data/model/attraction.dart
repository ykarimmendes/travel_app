import 'package:cloud_firestore/cloud_firestore.dart';

class Attraction {
  String title;
  String resume;
  int top;
  String topImage;
  String about;
  String photoCover;
  String photoCoverThumb;
  String category;
  bool isFavourite = false;
  DocumentReference reference;

  Attraction();

  Attraction.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Attraction.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        category = map['category'],
        resume = map['resume'],
        top = map['top'],
        photoCover = map['photo_cover'],
        photoCoverThumb = map['photo_cover_thumb'],
        about = map['about'],
        topImage = map['top_image'];
}
