import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite {

  final String id;
  final int type;
  DocumentReference reference;

  Favourite.fromNew(this.id, this.type);

  Favourite.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Favourite.fromMap(Map<String, dynamic> map, {this.reference})
      : id = map['id'],
        type = map['type'];
}
