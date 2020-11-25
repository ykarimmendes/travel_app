import 'package:cloud_firestore/cloud_firestore.dart';

class Event{

  final String title;
  final String smallDescription;
  final String description;
  final int priority;
  final DocumentReference reference;

  Event.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Event.fromMap(Map<String, dynamic> map, {this.reference})
    : title = map['title'],
      smallDescription = map['smallDescription'],
      description = map['description'],
      priority = map['priority'];
}



