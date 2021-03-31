import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/Local.dart';

class Attraction  extends Local{

  final int top;
  final String topImage;
  final String about;
  final String category;
  final GeoPoint geoPoint;
  bool isFavourite = false;

  Attraction.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), snapshot.reference);

  Attraction.fromMap(Map<String, dynamic> map, DocumentReference reference)
      : category = map['category'],
        top = map['top'],
        about = map['about'],
        geoPoint = map['geoLocation'],
        topImage = map['top_image'], super.fromMap(map,reference: reference);
}
