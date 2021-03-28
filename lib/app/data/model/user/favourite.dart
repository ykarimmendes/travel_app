import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite {

  final String id;
  final int type;

  Favourite.fromNew(this.id, this.type);

  Favourite.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());

  Favourite.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        type = map['type'];
}
