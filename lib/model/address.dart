import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  final String address;
  final String cep;
  final String neighborhood;
  final String number;

  final DocumentReference reference;

  Address.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Address.fromMap(Map<String, dynamic> map, {this.reference})
      : address = map['address'],
        cep = map['cep'],
        neighborhood = map['neighborhood'],
        number = map['number'];
}
