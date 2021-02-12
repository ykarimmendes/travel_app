import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  String email;
  String name;
  String id;
  List<String> favourites;
  DocumentReference reference;

  User();

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  User.fromMap(Map<String, dynamic> map, {this.reference})
      :email = map['email'],
       name = map['name'];
}
