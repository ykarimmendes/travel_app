import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite {

  final String _id;
  final String _type;
  final DocumentReference reference;

  Favourite.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Favourite.fromMap(Map<String, dynamic> map, {this.reference})
      : _id = map['id'],
        _type = map['type'];
}
