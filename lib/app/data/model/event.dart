import 'package:cloud_firestore/cloud_firestore.dart';

import 'address.dart';

class Event {
  final String title;
  final String smallDescription;
  final String description;
  final String about;
  final String date;
  final int priority;
  final String photoCover;
  final String photoCoverThumb;
  final Address address;
  final String category;
  final DocumentReference reference;

  Event.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Event.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        category = map['category'],
        smallDescription = map['smallDescription'],
        description = map['description'],
        date = map['date'],
        about = map['about'],
        photoCover = map['photo_cover'],
        photoCoverThumb = map['photo_cover_thumb'],
        address = Address.fromMap(map),
        priority = map['priority'];
}
