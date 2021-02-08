import 'package:cloud_firestore/cloud_firestore.dart';

class Attraction {
  final String title;
  final String resume;
  final int top;
  final String topImage;
  final String about;
  final String photoCover;
  final String photoCoverThumb;
  final String category;
  bool isFavourite;
  DocumentReference reference;

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
