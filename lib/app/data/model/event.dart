import 'package:cloud_firestore/cloud_firestore.dart';

import 'Local.dart';
import 'address.dart';

class Event extends Local{
  final String about;
  final String date;
  final int priority;
  final Address address;
  final String category;
  final GeoPoint geoPoint;


  Event.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(),  snapshot.reference);

  Event.fromMap(Map<String, dynamic> map, DocumentReference reference)
        : category = map['category'],
        date = map['date'],
        about = map['about'],
        geoPoint = map['geoLocation'],
        address = Address.fromMap(map),
        priority = map['priority'],
         super.fromMap(map,reference: reference);
}
